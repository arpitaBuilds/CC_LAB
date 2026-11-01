%{
#include <stdio.h>
int yylex();
int yyerror(char *);
%}

%token FOR ID NUM ASSIGN RELOP INCDEC

%%
expr : FOR '(' ID ASSIGN NUM ';' ID RELOP NUM ';' ID INCDEC ')' '{' '}'
      { printf("Valid for loop\n"); }
     ;
%%

int main()
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid for loop\n");
    return 0;
}