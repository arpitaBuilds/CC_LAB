%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);

int my_pow(int a, int b) {
    int result = 1;
    for (int i = 0; i < b; i++) {
        result = result * a;
    }
    return result;
}

int my_div(int a, int d) {
    if (d == 0) {
        printf("Error: Division by zero\n");
        exit(1);
    }
    return a / d;
}
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right '^'

%%
stmt: expr '\n' { printf("Result: %d\n", $1); }
    ;

expr: NUMBER
    { $$ = $1; }
    | expr '+' expr
    { $$ = $1 + $3; }
    | expr '-' expr
    { $$ = $1 - $3; }
    | expr '*' expr
    { $$ = $1 * $3; }
    | expr '/' expr
    { $$ = my_div($1, $3); }
    | expr '^' expr
    { $$ = my_pow($1, $3); }
    ;
%%

void yyerror(char *s) {
    printf("Parser Error\n");
    exit(1);
}

int main(void) {
    printf("Enter expression: ");
    yyparse();
    return 0;
}