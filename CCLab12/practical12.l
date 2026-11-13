
%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[0-9]+ {
    yylval = atoi(yytext);
    return NUM;
}

[+*/-] { return yytext[0]; }

[ \t\n] ;

. {
    printf("Invalid character: %s\n", yytext);
}
%%

int yywrap()
{
    return 1;
}
