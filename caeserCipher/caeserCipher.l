%{
    #include<stdio.h>
    int key = 5;
    void caesarCypher(char *yytext,int key);
%}

%%
[a-zA-Z]+ { caesarCypher(yytext , key);}
.         {ECHO;}
%%

void caesarCypher(char *yytext,int key){
    while(*yytext){
        printf("%c",(char)(((int)*yytext - 97 + key) % 26) + 97);
        yytext++;
    }
}

int main()
{
    FILE *file = fopen("encrypt.txt","r");
    yyin = file;
    yylex();   
}


int yywrap()
{
    return 1;
}
