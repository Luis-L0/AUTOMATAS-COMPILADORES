%option noyywrap
%{
	#include<stdio.h>
%}
NUMERO_DECIMAL ([0-9]+\.[0-9]+|\.[0-9]+)

%%
{NUMERO_DECIMAL} {printf ("NUMERO DECIMAL: =%s\n", yytext);}
%%
int main()
{
    yylex();
	return 0;
}