%{
/* 
 * HW5 Option 1: Lex/Flex starter template. 
   You need to complete Rule Section for lexer. 
 
   Tokens INTEGER, INVALID, WHITESPACE, NEWLINE are provided. 
   You need to define tokens operators (+,-,*,/) and parentheses, and return characters directly. For example, the rule for operator + is defined as "+" { return '+'; } 
   Above all, this lexer recognizes:
   - integers
   - operators: + - * /
   - parentheses: ( )
   - newline
   - invalid characters
  
   This lexer sends all tokens to the Yacc/Bison parser.
 
 */

#include "yacc.tab.h"   /* This provides token definitions from Yacc */
#include <stdlib.h>
%}

%%

[0-9]+          { yylval.ival = atoi(yytext); return INTEGER; } 

/*TODOS: your code needs to recognize operators (+,-,*,/) and parentheses, and return characters directly */
/* Your code must be here */

\n              { return '\n'; }
[ \t\r]+        { /* skip */ }
.               { return INVALID; } 


%%

int yywrap(void) {
    return 1;
}

/* No main() here. The main() will be provided by the Yacc/Bison file. */
