Program:
%{
    #include<stdio.h>
%}

%%
[0-9]+ {printf("%s \t",yytext);}
. ;

%%

int yywrap(){return 1;}
int main(int argc, char** argv){
    if(argc !=2){
        printf("use: %s testfile.txt\n",argv[0]);
        return 1;
    }
    FILE* file = fopen(argv[1], "r");
    if(!file){
        perror("error ");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    return 0;    
    
}
