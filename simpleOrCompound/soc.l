%{
    #include<stdio.h>
    int is_compound = 0;
    int flag;
%}

%%

(""[nN][oO][rR]"")|(""[aA][nN][dD]"")|(""[oO][rR]"")|(""[sS][oO]"")|(""[bB][uU][tT]"") { printf("The compound word used  is %s",yytext); flag=1;}

. {}
%%

int main(){
    printf("enter statement  : ");
    yylex(); 
    if(flag == 1) {printf("compound statement");}
    else {printf("simple statement");}
    
}


int yywrap(){
    return 1;
}
