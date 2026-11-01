%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER

%%
stmt: expr '\n' { printf("Result: %d\n", $1); }
    ;

expr: NUMBER
    | expr expr '+' { $$ = $1 + $2; }
    | expr expr '*' { $$ = $1 * $2; }
    ;
%%

void yyerror(char *s)
{
    printf("Error");
    exit(0);
}

int main(void)
{
    yyparse();
    return 0;
}