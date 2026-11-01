%{
#include <stdio.h>

int yylex();
int yyerror(char *);
int yywrap();
%}

%token KEYWORD ID comma

%%
declare: keyword_more id_more ';'
       ;

keyword_more: KEYWORD
            ;

id_more: ID
       | ID comma id_more
       ;
%%

int main()
{
    printf("enter expression:");
    yyparse();
    printf("valid expression");
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid for declaration\n");
    return 0;
}