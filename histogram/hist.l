%{
    #include<stdio.h>
    #include<string.h>
    void printHistogram();
    struct wordData{
        char word[20];
        int frequency;
    } words[100];
    int temp,length = 0;

%}

%%
[a-zA-Z]+ {
    temp = 0;
    for (int i=0;i < length; i++){
        if(strcmp(words[i].word,yytext) == 0){
            words[i].frequency++;
            temp = 1;
            break;
        }
    }
    if(temp == 0){
        strcpy(words[length].word,yytext);
        words[length].frequency = 1;
        length++;
    }
}

. {}
%%

int main()
{
    FILE *file = fopen("hist.txt","r");
    yyin = file;
    yylex();
    printHistogram();    
}
void printHistogram()
{
    for(int i=0;i<length;i++) {
        printf("%s : %d \n",words[i].word , words[i].frequency);
    }
}

int yywrap()
{
    return 1;
}
