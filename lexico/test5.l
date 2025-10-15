%option noyywrap
%{
	#include<stdio.h>
%}


CURP [A-Z]{4}[0-9]{6}[H|M]{1}[A-Z]{2}[A-Z]{3}[A-Z0-9]{2}

%%

{CURP} {printf("CURP ENCONTRADO: =%s\n", yytext);}

%%

int main()
{
    yylex();
	return 0;
}