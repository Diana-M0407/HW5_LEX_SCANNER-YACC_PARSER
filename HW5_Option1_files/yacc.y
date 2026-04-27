%{
/*
 * HW5 Option 1: Yacc/Bison starter template.
 *
 * You need to complete operator precedence, and grammar rules and semantic actions for: E, T, F (Nonterminals in the grammar G)
 *
 * This parser must:
 *   - Evaluate valid arithmetic expressions
 *   - Report message "Entered expression is invalid!" for any invalid expression
 *   - Detect division by zero, when it is detected, use YYERROR that triggers a real parse error from Bison, instead of calling yyerror() 
 *
 * IMPORTANT NOTE:
 * Yacc uses LALR(1) parsing, so left recursion is allowed in the grammar. Therefore, you may use the given grammar G (on HW5 page 1) directly.
 *
 */

#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

%}

/* Type of semantic value: all Nonterminals return int */
%union {
    int ival; 
}

/* Tokens from the lex source file (lex.l) Only two tokens needed here.
   In the lex source file (lex.l), you are forced to return the characters directly ('+' '-' '*' '/' '(' ')'), 
   and thus no declarations are needed for operators and parentheses.
*/
 %token <ival> INTEGER
 %token INVALID


/* TODO:Operator precedence and associativity(required for correct parsing)
    Declaration order is: Lowest precedence first, highest last 
    You need to declare a symbolic precedence name UMINUS for unary minus, and then apply it to the unary-minus production like this: '-' E %prec UMINUS, in the Grammar section
*/
/* your code here */

%type <ival> E T F //defining Nonterminal value types

%%

/* Start symbol: INPUT
    INPUT is the top-level nonterminal where Bison begins parsing.
*/
INPUT: 
      /* empty */
    | INPUT LINE   
;

/* Nonterminal: LINE
    Each LINE represents one input (a valid expression, or blank line, or an invalid expression) followed by Enter from the user.
*/
LINE:
      E '\n'      { printf("Result = %d\n", $1); } /* valid expression line */
    | '\n'        { /* blank line: do nothing */ }
    | error '\n'  { printf("Entered expression is invalid!\n"); yyerrok; } /* yyerrok is a Bison used inside an error-recovery rule: saying the error has been handled, skip this error and continue parsing the next line. */

;

/* TODO: Based on the grammar G on HW5 page1, write grammar rules and semantic actions for E, T, F.
   And when you want to trigger a parse error inside an action, such as the parser detects division by zero, use YYERROR that triggers a real parse error from Bison, instead of calling yyerror()  */
/* your code here */

%%

/* Error handler - which function must be defined even though you do not want to print anything there */
void yyerror(const char *s) {
    /* Intentionally empty.
    	In this code design, error messages are handled by the above recovery rule: LINE: error '\n' { printf("Entered expression is invalid!\n"); yyerrok; }
    */
}

int main(void) {
    /* For debugging you can uncomment the following line and test in the terminal. However, it must be commented in your final submission! */
    //printf("Enter expressions:\n");
    
    yyparse();
    return 0;
}
