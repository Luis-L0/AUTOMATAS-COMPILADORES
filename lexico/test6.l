%option noyywrap
%{
	#include<stdio.h>
%}


INSTITUCIONAL [a-z]{2}[0-9]{6}(@uaeh\.edu\.mx)
%%

{INSTITUCIONAL} {printf("CORREO INSTITUCIONAL ENCONTRADO: =%s\n", yytext);}

%%

int main()
{
    yylex();
	return 0;
}