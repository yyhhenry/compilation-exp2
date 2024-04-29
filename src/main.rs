use lalrpop_util::lalrpop_mod;

lalrpop_mod!(pub js);
mod ast;

fn main() {
    unimplemented!();
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
