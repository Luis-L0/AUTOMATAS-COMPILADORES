%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
%%
[A-Z] { printf("%c", yytext[0] +'a' - 'A'); }
. { printf ("%s", yytext);}
%%
int main()
{
        FILE *file_7;
	char name [] = "prueba.txt";
	file_7 = fopen(name, "r");

	if (!file_7){
	printf("Ocurrió un error al abrir el archivo.\n");
	return 1;
	}
	yyin = file_7;
	yylex();
	fclose(file_7);
	return 0;
}