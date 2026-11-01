%{
#include <stdio.h>
%}

%%
"hello"     { printf("got hello"); }
.|\n        ;
%%

int main()
{
    printf("Enter a String: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}