%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
"int"|"char"|"float"  { return KEYWORD; }
[a-zA-Z]+             { return ID; }
","                   { return comma; }
[;]                   { return yytext[0]; }
[ \t\n]+              {}
.                     {}
%%

int yywrap()
{
    return 1;
}
