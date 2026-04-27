HW5 Option 1 - Flex/Bison Arithmetic Expression Evaluator

Files:
- lex.l
- yacc.y
- README_HW5.txt

Compile and run on Linux / macOS / MSYS2:
flex lex.l
bison -d yacc.y
gcc lex.yy.c yacc.tab.c -o hw5_compiler
./hw5_compiler < sample_test_cases.txt > test_case_output.txt

Run manually:
./hw5_compiler
Then type one expression per line and press Enter.

Notes:
The program evaluates valid arithmetic expressions using +, -, *, /, unary minus, integers, and parentheses.
Invalid expressions and division by zero print:
Entered expression is invalid!
