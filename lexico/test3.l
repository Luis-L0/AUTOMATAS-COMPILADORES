%option noyywrap
%{
	#include<stdio.h>


%}
GUION_BA _
VARIABLE [a-zA-Z][a-zA-Z0-9|{GUION_BA}]*
%%

{VARIABLE} {printf("VARIABLE: =%s\n", yytext);}
%%
int main()
{
yylex();
	return 0;
}