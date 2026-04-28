%{
#include "yacc.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+          { yylval.ival = atoi(yytext); return INTEGER; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }

\n              { return '\n'; }
[ \t\r]+        { /* skip whitespace */ }
.               { return INVALID; }

%%

int yywrap(void) {
    return 1;
}
