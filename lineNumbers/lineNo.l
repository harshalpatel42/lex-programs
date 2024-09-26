%{
    #include <stdio.h>
    int number = 1;
%}

%%
\n {}
[^\n]+ { printf("%d %s \n",number++,yytext); }
%%


int yywrap(){return 1;}
int main() {
    yyin = fopen("fact.c", "r"); 
    yylex();
    fclose(yyin);
    return 0;
}
