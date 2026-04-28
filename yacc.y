%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int ival;
}

%token <ival> INTEGER
%token INVALID

/* Lowest precedence first, highest last */
%left '+' '-'
%left '*' '/'
%right UMINUS

%type <ival> E T F

%%

INPUT:
      /* empty */
    | INPUT LINE
;

LINE:
      E '\n'      { printf("Result = %d\n", $1); }
    | '\n'        { /* blank line */ }
    | error '\n'  { printf("Entered expression is invalid!\n"); yyerrok; }
;

E:
      E '+' T     { $$ = $1 + $3; }
    | E '-' T     { $$ = $1 - $3; }
    | '-' E %prec UMINUS { $$ = -$2; }
    | T           { $$ = $1; }
;

T:
      T '*' F     { $$ = $1 * $3; }
    | T '/' F     {
                      if ($3 == 0) {
                          YYERROR;
                      } else {
                          $$ = $1 / $3;
                      }
                  }
    | F           { $$ = $1; }
;

F:
      INTEGER     { $$ = $1; }
    | '(' E ')'   { $$ = $2; }
;

%%

void yyerror(const char *s) {
    /* Error output handled by LINE: error '\n' */
}

int main(void) {
    yyparse();
    return 0;
}
