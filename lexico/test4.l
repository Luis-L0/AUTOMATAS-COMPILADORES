%option noyywrap
%{
	#include<stdio.h>
%}
RFC [A-ZÑ&]{3,4}[0-9]{6}[A-Z0-9]{3} 
%%
{RFC} {printf("RFC ENCONTRADO: =%s\n", yytext);}
%%
int main()
{
yylex();
	return 0;
}