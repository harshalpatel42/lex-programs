%{
    #include<stdio.h>
    int convert(char *roman);
%}
%%
[IVXLCDM]+ {   printf("%d",convert(yytext));}
. { printf("invalid");}

%%

int main(){
   printf("enter roman number: ");
    yylex(); 
}

int convert(char *roman){
    int total = 0;
    int last = 0;
    while(*roman){
        int current;
        switch(*roman){
            case 'I': current = 1; break;
            case 'V': current = 5; break;
            case 'X': current = 10; break;
            case 'L': current = 50; break;
            case 'C': current = 100; break;
            case 'D': current = 500; break;
            case 'M': current = 1000; break;
            default: break;
        }
        if(current > last)  total += current - 2 * last;
        else total += current;
        last = current;
        roman++;
    }
        return total;
}

int yywrap(){
    return 1;
}
