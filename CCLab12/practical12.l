%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.place = strdup(yytext);
    return ID;
}
[+*]    { return yytext[0]; }
[ \t\n] ;
.       ;
%%

int yywrap()
{
    return 1;
}