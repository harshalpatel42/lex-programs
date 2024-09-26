%{
#include <stdio.h>
int line= 0;
int inside_comment = 0;
%}

%%
"//"[^\n]+ {line++;}
"/*" { inside_comment = 1; line ++;}
\n  { if(inside_comment == 1) line++;}
"*/"    { if(inside_comment = 1) inside_comment = 0;}
. {}
%%

int main()
{
    FILE *file = fopen("comLines.c","r");
    yyin = file;
    yylex();
    printf("comment lines: %d\n" , line);
}

int yywrap()
{
    return 1;
}
