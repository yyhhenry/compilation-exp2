use std::collections::{BTreeMap, BTreeSet};

// Simple JavaScript AST
use serde::{Deserialize, Serialize};
#[derive(Debug, Clone, Copy, Serialize, Deserialize, PartialEq)]
pub enum BinOp {
    /// +
    Add,
    /// -
    Sub,
    /// *
    Mul,
    /// /
    Div,
    /// %
    Mod,
    /// ==
    Eq,
    /// !=
    Ne,
    /// ===
    StrictEq,
    /// !==
    StrictNe,
    /// <
    Lt,
    /// <=
    Le,
    /// >
    Gt,
    /// >=
    Ge,
    /// &&
    And,
    /// ||
    Or,
    /// in
    In,
    /// instanceof
    InstanceOf,
    /// a[b] or a.b (Known as Member)
    Idx,
}

#[derive(Debug, Clone, Copy, Serialize, Deserialize, PartialEq)]
pub enum UnOp {
    /// !
    Not,
    /// -
    Neg,
    /// +
    Pos,
    /// typeof
    TypeOf,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub enum Literal {
    Number(f64),
    String(String),
    Boolean(bool),
    Null,
    Undefined,
    Array(Vec<Expr>),
    Object(BTreeMap<String, Expr>),
    /// For error recovery
    Error,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub enum Expr {
    Literal(Literal),
    BinOp(BinOp, Box<Expr>, Box<Expr>),
    UnOp(UnOp, Box<Expr>),
    Cond {
        cond: Box<Expr>,
        then: Box<Expr>,
        r#else: Box<Expr>,
    },
    Ident(String),
    Call {
        func: Box<Expr>,
        args: Vec<Expr>,
    },
    New {
        func: Box<Expr>,
        args: Vec<Expr>,
    },
    /// For error recovery
    Error,
}
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct Init {
    pub name: String,
    pub value: Expr,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub enum Stmt {
    Expr(Expr),
    If {
        cond: Expr,
        then: Box<Stmt>,
        r#else: Option<Box<Stmt>>,
    },
    While {
        cond: Expr,
        body: Box<Stmt>,
    },
    Block(StmtList),
    Let(Vec<Init>),
    Const(Vec<Init>),
    Function {
        name: String,
        params: Vec<String>,
        body: Box<Stmt>,
    },
    /// `return` statement with an optional expression
    /// Expr::Undefined if no expression is provided
    Return(Expr),
    Break,
    Continue,
    Empty,
    /// For error recovery
    Error,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct StmtList(pub Vec<Stmt>);

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct JavaScript {
    pub body: StmtList,
}

/// Error when duplicate key is found in object literal
pub fn k_v_list_to_object(list: Vec<(String, Expr)>) -> Literal {
    let keys: BTreeSet<_> = list.iter().map(|(k, _)| k).collect();
    if keys.len() != list.len() {
        return Literal::Error;
    }
    Literal::Object(list.into_iter().collect())
}
