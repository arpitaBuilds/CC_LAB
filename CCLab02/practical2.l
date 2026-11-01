%{
#include <stdio.h>
int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/"  { comments++; }
"//".*                      { comments++; }
"if"|"else"|"for"|"while"|"return"|"void" { keywords++; }
[a-zA-Z_][a-zA-Z0-9_]*      { identifiers++; }
[ \t]+                      { spaces++; }
\n                          { lines++; }
.                           { words++; }
%%

int main()
{
    printf("Enter a String: ");
    yylex();
    printf("Comments count: %d\n", comments);
    printf("Keywords count: %d\n", keywords);
    printf("Identifiers count: %d\n", identifiers);
    printf("Words count: %d\n", words);
    printf("Lines count: %d\n", lines);
    printf("Spaces count: %d\n", spaces);
    return 0;
}

int yywrap()
{
    return 1;
}