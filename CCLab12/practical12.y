%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(char *);
int temp = 1;

char* newtemp()
{
    char *s = malloc(10);
    sprintf(s, "t%d", temp++);
    return s;
}
%}

%union {
    char *place;
}

%token <place> ID
%type <place> E T F

%left '+'
%left '*'

%%
I : ID '=' E
    {
        printf("%s = %s\n", $1, $3);
    }
    ;

E : E '+' T
    {
        $$ = newtemp();
        printf("%s = %s + %s\n", $$, $1, $3);
    }
  | T
    {
        $$ = $1;
    }
    ;

T : T '*' F
    {
        $$ = newtemp();
        printf("%s = %s * %s\n", $$, $1, $3);
    }
  | F
    {
        $$ = $1;
    }
    ;

F : ID
    {
        $$ = $1;
    }
    ;
%%

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}