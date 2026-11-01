%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"for"                       { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }
[0-9]+                      { return NUM; }
"++"|"--"                   { return INCDEC; }
"<"|">"|"<="|">="|"=="|"!=" { return RELOP; }
"="                         { return ASSIGN; }
[();{}]                     { return yytext[0]; }
[ \t\n]+                    { }
.                           { }
%%

int yywrap()
{
    return 1;
}