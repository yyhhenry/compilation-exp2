use anyhow::{bail, Result};
use clap::Parser;
use lalrpop_util::{lalrpop_mod, ParseError};

use crate::js::JavaScriptParser;

lalrpop_mod!(pub js);
mod ast;
/// JavaScript Parser
#[derive(Parser)]
struct Args {
    /// Input JS Code (.js)
    input_file: String,
    /// Output AST file  (.json)
    #[clap(short, long)]
    output_file: Option<String>,
}

struct LinePos<'s> {
    s: &'s str,
    line_start: Vec<usize>,
}
impl<'s> LinePos<'s> {
    /// Create a new LinePos from a string
    /// The string must end with a newline
    fn new(s: &'s str) -> Self {
        assert!(s.ends_with('\n'));
        let mut line_start = vec![0];
        for (i, c) in s.char_indices() {
            if c == '\n' {
                line_start.push(i + 1);
            }
        }
        Self { s, line_start }
    }
    fn get_line(&self, pos: usize) -> usize {
        match self.line_start.binary_search(&pos) {
            Ok(i) => i,
            Err(i) => i - 1,
        }
    }
    fn get_line_pos(&self, pos: usize) -> (usize, usize) {
        let pos = pos.min(self.s.len());
        let line = self.get_line(pos);
        let start = self.line_start[line];
        (line, pos - start)
    }
    fn get_line_str(&self, line: usize) -> Result<&str> {
        let start = self
            .line_start
            .get(line)
            .copied()
            .ok_or_else(|| anyhow::anyhow!("Line not found"))?;
        let end = self
            .line_start
            .get(line + 1)
            .copied()
            .unwrap_or(self.s.len());
        Ok(&self.s[start..end])
    }
    fn source(&self, filename: &str, msg: &str, pos: usize) -> Result<String> {
        let (line, line_pos) = self.get_line_pos(pos);
        let line_str = self.get_line_str(line)?;
        Ok(format!(
            "[{}:{}:{}] {}\n{}\n{}",
            filename,
            line + 1,
            line_pos + 1,
            msg,
            line_str,
            " ".repeat(line_pos) + "^"
        ))
    }
}

fn main() -> Result<()> {
    let args = Args::parse();
    let mut input = std::fs::read_to_string(&args.input_file)?;
    if !input.ends_with('\n') {
        input.push('\n');
    }
    let line_pos = LinePos::new(&input);
    let mut errors = Vec::new();
    let ast = match JavaScriptParser::new().parse(&mut errors, &input) {
        Ok(ast) => ast,
        Err(e) => {
            let (msg, pos) = match e {
                ParseError::InvalidToken { location } => ("Invalid Token".to_string(), location),
                ParseError::UnrecognizedEof { location, .. } => {
                    ("Unrecognized EOF".to_string(), location)
                }
                ParseError::UnrecognizedToken { token, .. } => {
                    ("Unrecognized Token".to_string(), token.0)
                }
                ParseError::ExtraToken { token } => ("Extra Token".to_string(), token.0),
                _ => ("Unknown Error".to_string(), 0),
            };
            eprintln!("{}", line_pos.source(&args.input_file, &msg, pos)?);
            bail!("Error parsing input file");
        }
    };
    let output = serde_json::to_string_pretty(&ast)?;
    if let Some(output_file) = args.output_file {
        let output_file = std::path::Path::new(&output_file).with_extension("json");
        let out_dir = output_file
            .parent()
            .ok_or_else(|| anyhow::anyhow!("Output file must have a parent directory"))?;
        std::fs::create_dir_all(out_dir)?;
        std::fs::write(output_file, output)?;
    } else {
        println!("{}", output);
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        let mut errors = Vec::new();
        let ast = match js::JavaScriptParser::new()
            .parse(&mut errors, r#"1;"1\"5"+1;{-10};let pi = Math.acos(-1);"#)
        {
            Ok(ast) => ast,
            Err(e) => {
                eprintln!("Error: {:?}", e);
                return;
            }
        };
        println!("{}", serde_json::to_string_pretty(&ast).unwrap());
        for e in errors {
            eprintln!("Error: {:?}", e.error);
        }
    }
}
