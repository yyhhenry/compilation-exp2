# 编译原理实验-语法分析器

采用Rust编写的简单JavaScript语法分析器，支持生成JSON格式的抽象语法树。

```bash
# Examples
cargo r -r -- data/correct.js -o tmp/correct.json
cargo r -r -- data/err1-大括号不匹配.js
cargo r -r -- data/err2-不正确的函数体.js
cargo r -r -- data/expr-errors.js
```
