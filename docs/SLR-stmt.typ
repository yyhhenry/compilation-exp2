= Grammar

+ $S' -> dot S$
+ $S' -> S dot$
+ $S -> dot "<StmtList>"$
+ $S -> "<StmtList>" dot$
+ $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
+ $"<StmtList>" -> "<Stmt>" dot "<StmtList>"$
+ $"<StmtList>" -> "<Stmt>" "<StmtList>" dot$
+ $"<StmtList>" -> dot$
+ $"<Block>" -> dot "{" "<StmtList>" "}"$
+ $"<Block>" -> "{" dot "<StmtList>" "}"$
+ $"<Block>" -> "{" "<StmtList>" dot "}"$
+ $"<Block>" -> "{" "<StmtList>" "}" dot$
+ $"<Stmt>" -> dot "<FuncDecl>"$
+ $"<Stmt>" -> "<FuncDecl>" dot$
+ $"<Stmt>" -> dot "<Block>"$
+ $"<Stmt>" -> "<Block>" dot$
+ $"<Stmt>" -> dot "stmt"$ 
+ $"<Stmt>" -> "stmt" dot$
+ $"<FuncDecl>" -> dot "<FuncHeader>" "<Block>"$
+ $"<FuncDecl>" -> "<FuncHeader>" dot "<Block>"$
+ $"<FuncDecl>" -> "<FuncHeader>" "<Block>" dot$

这里的$"stmt"$是一个虚构的终结符，用来简化这一段的分析，表示任意一个语句。而$"<FuncHeader>"$表示函数的头部，包括函数名、参数列表等，虽然是一个非终结符，但是在这里可以看作是一个整体。

所以等价看作终结符的有$"stmt"$, $"<FuncHeader>"$, $"{"$ 和 $"}"$。

非终结符有$S'$, $S$, $"<StmtList>"$, $"<Block>"$, $"<Stmt>"$ 和 $"<FuncDecl>"$。

= SLR(1)

首先求出LR(0)项集族：

+ $I_0 = epsilon"-closure"({S' -> dot S}):$
    - $S' -> dot S$
    - $S -> dot "<StmtList>"$
    - $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
    - $"<StmtList>" -> dot$
    - $"<Stmt>" -> dot "<FuncDecl>"$
    - $"<Stmt>" -> dot "<Block>"$
    - $"<Stmt>" -> dot "stmt"$
    - $"<FuncDecl>" -> dot "<FuncHeader>" "<Block>"$
    - $"<Block>" -> dot "{" "<StmtList>" "}"$

+ $I_1 = "GO"(I_0, S)$
    - $S' -> S dot$

+ $I_2 = "GO"(I_0, "<StmtList>")$
    - $S -> "<StmtList>" dot$

+ $I_3 = "GO"(I_0, "<Stmt>")$
    - $"<StmtList>" -> "<Stmt>" dot "<StmtList>"$
    - $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
    - $"<StmtList>" -> dot$
    - $"<Stmt>" -> dot "<FuncDecl>"$
    - $"<Stmt>" -> dot "<Block>"$
    - $"<Stmt>" -> dot "stmt"$
    - $"<FuncDecl>" -> dot "<FuncHeader>" "<Block>"$
    - $"<Block>" -> dot "{" "<StmtList>" "}"$

+ $I_4 = "GO"(I_0, "<FuncDecl>")$
    - $"<Stmt>" -> "<FuncDecl>" dot$

+ $I_5 = "GO"(I_0, "<Block>")$
    - $"<Stmt>" -> "<Block>" dot$

+ $I_6 = "GO"(I_0, "stmt")$
    - $"<Stmt>" -> "stmt" dot$

+ $I_7 = "GO"(I_0, "<FuncHeader>")$
    - $"<FuncDecl>" -> "<FuncHeader>" dot "<Block>"$
    - $"<Block>" -> dot "{" "<StmtList>" "}"$

+ $I_8 = "GO"(I_0, "{")$
    - $"<Block>" -> "{" dot "<StmtList>" "}"$
    - $"<StmtList>" -> dot "<Stmt>" "<StmtList>"$
    - $"<StmtList>" -> dot$
    - $"<Stmt>" -> dot "<FuncDecl>"$
    - $"<Stmt>" -> dot "<Block>"$
    - $"<Stmt>" -> dot "stmt"$
    - $"<FuncDecl>" -> dot "<FuncHeader>" "<Block>"$
    - $"<Block>" -> dot "{" "<StmtList>" "}"$

+ $I_9 = "GO"(I_3, "<StmtList>")$
    - $"<StmtList>" -> "<Stmt>" "<StmtList>" dot$

+ $"GO"(I_3, "<Stmt>") = I_3$

+ $"GO"(I_3, "<FuncDecl>") = I_4$

+ $"GO"(I_3, "<Block>") = I_5$

+ $"GO"(I_3, "stmt") = I_6$

+ $"GO"(I_3, "<FuncHeader>") = I_7$

+ $"GO"(I_3, "{") = I_8$

+ $I_10 = "GO"(I_7, "<Block>")$
    - $"<FuncDecl>" -> "<FuncHeader>" "<Block>" dot$

+ $"GO"(I_7, "{") = I_8$

+ $I_11 = "GO"(I_8, "<StmtList>")$
    - $"<Block>" -> "{" "<StmtList>" dot "}"$

+ $"GO"(I_8, "<Stmt>") = I_3$

+ $"GO"(I_8, "<FuncDecl>") = I_4$

+ $"GO"(I_8, "<Block>") = I_5$

+ $"GO"(I_8, "stmt") = I_6$

+ $"GO"(I_8, "<FuncHeader>") = I_7$

+ $"GO"(I_8, "{") = I_8$

+ $I_12 = "GO"(I_11, "}")$
    - $"<Block>" -> "{" "<StmtList>" "}" dot$
