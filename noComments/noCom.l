%{
#include <stdio.h>
int inside_comment = 0;
FILE *output;
%}

%%
"//"[^\n]+ {}
"/*" { inside_comment = 1;}
\n  { if(inside_comment == 0) fputc(yytext[0],output);}
"*/"    { if(inside_comment = 1) inside_comment = 0;}
. { if(inside_comment == 0) fputc(yytext[0],output);}
%%

int main()
{
    FILE *file = fopen("com.cpp","r");
    output = fopen("nocom.cpp","w");
    yyin = file;
    yylex();
    printf("done");
}

int yywrap()
{
    return 1;
}
