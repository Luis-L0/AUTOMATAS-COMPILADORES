%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
VARIABLE [a-zA-Z][a-zA-Z0-9|{GUION_BA}]*

TIPOS_DATOS (int|float|double|char|void|long|short|signed|unsigned|struct|union|enum)

PALABRAS_RESERVADAS (auto|break|case|const|continue|default|do|else|for|goto|if|register|return|sizeof|static|switch|typedef|volatile|while|extern)

%%
{TIPOS_DATOS} {printf ("TIPO_DE_DATO: %s\n", yytext);}

{PALABRAS_RESERVADAS} {printf ("PALABRA_RESERVADA: %s\n", yytext);}

{VARIABLE} {printf ("VARIABLE: %s\n", yytext);}
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