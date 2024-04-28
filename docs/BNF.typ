+ $"<Program>" -> "<StmtList>"$

+ $"<StmtList>" -> "<Stmt>" "<StmtList>" | ε$

+ $"<Stmt>" -> "<Decl>" | "<ExprStmt>" | "<CtrlFlow>" | "<FuncDecl>" | "<ReturnStmt>" | ";" | "{" "<StmtList>" "}"$

+ $"<Decl>" -> "let" "<Var>" "<Init>" | "const" "<Var>" "=" "<Expr>" ";"$

+ $"<Init>" -> "=" "<Expr>" ";"$

+ $"<Init>" -> ";"$

+ $"<Var>" -> "<Ident>"$

+ $"<ExprStmt>" -> "<Expr>" ";"$

+ $"<Expr>" -> "<LogicalOrExpr>"$

+ $"<LogicalOrExpr>" -> "<LogicalAndExpr>" "<LogicalOrExprTail>"$

+ $"<LogicalOrExprTail>" -> "||" "<LogicalAndExpr>" "<LogicalOrExprTail>"$

+ $"<LogicalOrExprTail>" -> ε$

+ $"<LogicalAndExpr>" -> "<EqualityExpr>" "<LogicalAndExprTail>"$

+ $"<LogicalAndExprTail>" -> "&&" "<EqualityExpr>" "<LogicalAndExprTail>"$

+ $"<LogicalAndExprTail>" -> ε$

+ $"<EqualityExpr>" -> "<RelationalExpr>" "<EqualityExprTail>"$

+ $"<EqualityExprTail>" -> "==" "<RelationalExpr>" "<EqualityExprTail>"$

+ $"<EqualityExprTail>" -> "!=" "<RelationalExpr>" "<EqualityExprTail>"$

+ $"<EqualityExprTail>" -> ε$

+ $"<RelationalExpr>" -> "<AdditiveExpr>" "<RelationalExprTail>"$

+ $"<RelationalExprTail>" -> "<" "<AdditiveExpr>" "<RelationalExprTail>"$

+ $"<RelationalExprTail>" -> ">" "<AdditiveExpr>" "<RelationalExprTail>"$

+ $"<RelationalExprTail>" -> "<=" "<AdditiveExpr>" "<RelationalExprTail>"$

+ $"<RelationalExprTail>" -> ">=" "<AdditiveExpr>" "<RelationalExprTail>"$

+ $"<RelationalExprTail>" -> ε$

+ $"<AdditiveExpr>" -> "<Term>" "<AdditiveExprTail>"$

+ $"<AdditiveExprTail>" -> "+" "<Term>" "<AdditiveExprTail>"$

+ $"<AdditiveExprTail>" -> "-" "<Term>" "<AdditiveExprTail>"$

+ $"<AdditiveExprTail>" -> ε$

+ $"<Term>" -> "<Factor>" "<TermTail>"$

+ $"<TermTail>" -> "*" "<Factor>" "<TermTail>"$

+ $"<TermTail>" -> "/" "<Factor>" "<TermTail>"$

+ $"<TermTail>" -> ε$

+ $"<Factor>" -> "<UnaryExpr>" | "<PostfixExpr>"$

+ $"<UnaryExpr>" -> "+" "<PostfixExpr>" | "-" "<PostfixExpr>" | "!" "<PostfixExpr>"$

+ $"<PostfixExpr>" -> "<PrimaryExpr>" "<PostfixExprTail>"$

+ $"<PostfixExprTail>" -> "(" "<ParamListOpt>" ")" "<PostfixExprTail>"$

+ $"<PostfixExprTail>" -> "[" "<Expr>" "]" "<PostfixExprTail>"$

+ $"<PostfixExprTail>" -> "." "<Ident>" "<PostfixExprTail>" $

+ $"<PostfixExprTail>" -> ε$

+ $"<PrimaryExpr>" ->  "<Lit>" | "<Ident>" | "(" "<Expr>" ")" | "<Array>" | "<Obj>"$

+ $"<ParamListOpt>" -> "<ParamList>"$

+ $"<ParamListOpt>" -> ε$

+ $"<ParamList>" -> "<Expr>" "<ParamListTail>"$

+ $"<ParamListTail>" -> "," "<Expr>" "<ParamListTail>"$

+ $"<ParamListTail>" -> ε$

+ $"<Lit>" -> "<Num>" | "<Str>" | "true" | "false"$

+ $"<Lit>" -> "null" | "undefined" | "<Array>" | "<Obj>"$

+ $"<Array>" -> "[" "<ExprListOpt>" "]"$

+ $"<Obj>" -> "{" "<KVPListOpt>" "}"$

+ $"<KVPListOpt>" -> "<KVPList>"$

+ $"<KVPListOpt>" -> ε$

+ $"<KVPList>" -> "<KVP>" "<KVPListTail>"$

+ $"<KVPListTail>" -> "," "<KVP>" "<KVPListTail>"$

+ $"<KVPListTail>" -> ε$

+ $"<KVP>" -> "<Ident>" ":" "<Expr>"$

+ $"<CtrlFlow>" -> "if" "(" "<Expr>" ")" "<Stmt>" "<ElseOpt>"$

+ $"<CtrlFlow>" -> "while" "(" "<Expr>" ")" "<Stmt>" $

+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>" $

+ $"<ElseOpt>" -> "else" "<Stmt>"$

+ $"<ElseOpt>" -> ε$

+ $"<ForInit>" -> "<Decl>" | "<ExprStmt>" | ";"$

+ $"<ExprOpt>" -> "<Expr>"$

+ $"<ExprOpt>" -> ε$

+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$

+ $"<FormalParamsOpt>" -> "<FormalParams>"$

+ $"<FormalParamsOpt>" -> ε$

+ $"<FormalParams>" -> "<Var>" "<FormalParamsTail>"$

+ $"<FormalParamsTail>" -> "," "<Var>" "<FormalParamsTail>"$

+ $"<FormalParamsTail>" -> ε$

+ $"<ReturnStmt>" -> "return" "<ExprOpt>" ";"$