= Grammar

+ $S -> dot "<Program>"$
+ $S -> "<Program>" dot$

+ $"<Program>" -> dot"<StmtList>"$
+ $"<Program>" -> "<StmtList>" dot$

+ $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
+ $"<StmtList>" -> "<Stmt>" dot "<StmtList>"$
+ $"<StmtList>" -> "<Stmt>" "<StmtList>" dot$

+ $"<StmtList>" -> dot$

+ $"<Stmt>" -> dot "<Decl>"$
+ $"<Stmt>" -> "<Decl>" dot$

+ $"<Stmt>" -> dot "<ExprStmt>"$
+ $"<Stmt>" -> "<ExprStmt>" dot$

+ $"<Stmt>" -> dot "<CtrlFlow>"$
+ $"<Stmt>" -> "<CtrlFlow>" dot$

+ $"<Stmt>" -> dot "<FuncDecl>"$
+ $"<Stmt>" -> "<FuncDecl>" dot$

+ $"<Stmt>" -> dot "<ReturnStmt>"$
+ $"<Stmt>" -> "<ReturnStmt>" dot$

+ $"<Stmt>" -> dot ";"$
+ $"<Stmt>" -> ";" dot$

+ $"<Stmt>" -> dot "{" "<StmtList>" "}"$
+ $"<Stmt>" -> "{" dot "<StmtList>" "}"$
+ $"<Stmt>" -> "{" "<StmtList>" dot "}"$
+ $"<Stmt>" -> "{" "<StmtList>" "}" dot$

+ $"<Decl>" -> dot "let" "<Var>" "<Init>"$
+ $"<Decl>" -> "let" dot "<Var>" "<Init>"$
+ $"<Decl>" -> "let" "<Var>" dot "<Init>"$
+ $"<Decl>" -> "let" "<Var>" "<Init>" dot$

+ $"<Decl>" -> dot "const" "<Var>" "=" "<Expr>" ";"$
+ $"<Decl>" -> "const" dot "<Var>" "=" "<Expr>" ";"$
+ $"<Decl>" -> "const" "<Var>" dot "=" "<Expr>" ";"$
+ $"<Decl>" -> "const" "<Var>" "=" dot "<Expr>" ";"$
+ $"<Decl>" -> "const" "<Var>" "=" "<Expr>" dot ";"$
+ $"<Decl>" -> "const" "<Var>" "=" "<Expr>" ";" dot$

+ $"<ExprStmt>" -> dot "<Expr>" ";"$
+ $"<ExprStmt>" -> "<Expr>" dot ";"$
+ $"<ExprStmt>" -> "<Expr>" ";" dot$

+ $"<CtrlFlow>" -> dot "if" "(" "<Expr>" ")" "<Stmt>" "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" dot "(" "<Expr>" ")" "<Stmt>" "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" "(" dot "<Expr>" ")" "<Stmt>" "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" "(" "<Expr>" dot ")" "<Stmt>" "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" "(" "<Expr>" ")" dot "<Stmt>" "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" "(" "<Expr>" ")" "<Stmt>" dot "<ElseOpt>"$
+ $"<CtrlFlow>" -> "if" "(" "<Expr>" ")" "<Stmt>" "<ElseOpt>" dot$

+ $"<CtrlFlow>" -> dot "while" "(" "<Expr>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "while" dot "(" "<Expr>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "while" "(" dot "<Expr>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "while" "(" "<Expr>" dot ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "while" "(" "<Expr>" ")" dot "<Stmt>"$
+ $"<CtrlFlow>" -> "while" "(" "<Expr>" ")" "<Stmt>" dot$

+ $"<CtrlFlow>" -> dot "for" "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" dot "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" dot "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" dot "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" dot ";" "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" ";" dot "<ExprOpt>" ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" dot ")" "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" dot "<Stmt>"$
+ $"<CtrlFlow>" -> "for" "(" "<ForInit>" "<ExprOpt>" ";" "<ExprOpt>" ")" "<Stmt>" dot$

+ $"<ElseOpt>" -> dot "else" "<Stmt>"$
+ $"<ElseOpt>" -> "else" dot "<Stmt>"$
+ $"<ElseOpt>" -> "else" "<Stmt>" dot$

+ $"<ElseOpt>" -> dot$

+ $"<ForInit>" -> dot "<Decl>"$
+ $"<ForInit>" -> "<Decl>" dot$

+ $"<ForInit>" -> dot "<ExprStmt>"$
+ $"<ForInit>" -> "<ExprStmt>" dot$

+ $"<ForInit>" -> dot ";"$
+ $"<ForInit>" -> ";" dot$

+ $"<ExprOpt>" -> dot "<Expr>"$
+ $"<ExprOpt>" -> "<Expr>" dot$

+ $"<ExprOpt>" -> dot$

+ $"<FuncDecl>" -> dot "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" dot "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" dot "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" dot "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" dot ")" "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" dot "{" "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" dot "<StmtList>" "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" dot "}"$
+ $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}" dot$

+ $"<FormalParamsOpt>" -> dot "<FormalParams>"$
+ $"<FormalParamsOpt>" -> "<FormalParams>" dot$

+ $"<FormalParamsOpt>" -> dot$

+ $"<FormalParams>" -> dot "<Var>" "<FormalParamsTail>"$
+ $"<FormalParams>" -> "<Var>" dot "<FormalParamsTail>"$
+ $"<FormalParams>" -> "<Var>" "<FormalParamsTail>" dot$

+ $"<FormalParamsTail>" -> dot "," "<Var>" "<FormalParamsTail>"$
+ $"<FormalParamsTail>" -> "," dot "<Var>" "<FormalParamsTail>"$
+ $"<FormalParamsTail>" -> "," "<Var>" dot "<FormalParamsTail>"$
+ $"<FormalParamsTail>" -> "," "<Var>" "<FormalParamsTail>" dot$

+ $"<FormalParamsTail>" -> dot$

+ $"<ReturnStmt>" -> dot "return" "<ExprOpt>" ";"$
+ $"<ReturnStmt>" -> "return" dot "<ExprOpt>" ";"$
+ $"<ReturnStmt>" -> "return" "<ExprOpt>" dot ";"$
+ $"<ReturnStmt>" -> "return" "<ExprOpt>" ";" dot$
