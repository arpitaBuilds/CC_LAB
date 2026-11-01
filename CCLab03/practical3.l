%{
#include <stdio.h>
int numbers = 0;
int a_word = 0;
%}

%%
[0-9]+(\.[0-9]+)?([Ee][+-]?[0-9]+)?  { numbers++; }
[aA][a-zA-Z]*                        { a_word++; }
%%

int main()
{
    printf("Enter input:\n");
    yylex();
    printf("Numbers: %d\n", numbers);
    printf("Count of word starting with a/A: %d\n", a_word);
    return 0;
}

int yywrap()
{
    return 1;
}