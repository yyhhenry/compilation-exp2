= Grammar

1. $S -> dot "<Program>"$
2. $S -> "<Program>" dot$

3. $"<Program>" -> dot "<StmtList>"$
4. $"<Program>" -> "<StmtList>" dot$

5. $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
6. $"<StmtList>" -> "<Stmt>" dot "<StmtList>"$
7. $"<StmtList>" -> "<Stmt>" "<StmtList>" dot$

8. $"<StmtList>" -> dot$

9. $"<Stmt>" -> dot "<FuncDecl>"$
10. $"<Stmt>" -> "<FuncDecl>" dot$

11. $"<Stmt>" -> dot "{" "<StmtList>" "}"$
12. $"<Stmt>" -> "{" dot "<StmtList>" "}"$
13. $"<Stmt>" -> "{" "<StmtList>" dot "}"$
14. $"<Stmt>" -> "{" "<StmtList>" "}" dot$

15. $"<FuncDecl>" -> dot "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
16. $"<FuncDecl>" -> "function" dot "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
17. $"<FuncDecl>" -> "function" "<Ident>" dot "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
18. $"<FuncDecl>" -> "function" "<Ident>" "(" dot "<FormalParamsOpt>" ")" "{" "<StmtList>" "}"$
19. $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" dot ")" "{" "<StmtList>" "}"$
20. $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" dot "{" "<StmtList>" "}"$
21. $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" dot "<StmtList>" "}"$
22. $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" dot "}"$
23. $"<FuncDecl>" -> "function" "<Ident>" "(" "<FormalParamsOpt>" ")" "{" "<StmtList>" "}" dot$
