%option noyywrap
%{
	#include<stdio.h>
%}

%%
NUMEROS [0-9]+
%%
int main()
{
NUMEROS {printf ("NUMEROS ENTEROS: =%s\n", yytext);}
yylex();
	return 0;
}