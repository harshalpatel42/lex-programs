%{
    #include<stdio.h>
    int vowel=0;
    int cons=0;
%}

%%

[aeiouAEIOU] {vowel++;}
[a-zA-Z] {cons++;}

%%
int yywrap(){}
int main()
{
    printf("Enter the string of vowels and consonants:");
    yylex();
    printf("Number of vowels are: %d\n", vowel);
    printf("Number of consonants are: %d\n", cons);
    return 0;
} 
