%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
	int cont = 0;
%}

VARIABLE [a-zA-Z]+[0-9]*
NUMERO [0-9]+
OPERADOR_ART [+\-*/]
OP_LOGICOS (&&|\|\||!|<=|>=|==|!=|<|>)
COMENTARIO1 "//".*
COMENTARIO2 "/\\([^]|\\+[^/])\\+/"


%%
{COMENTARIO1}        { cont++; }
{COMENTARIO2}        { cont++; }

"if" { printf("Palabra reservada: IF\n"); }
"else" { printf("Palabra reservada: ELSE\n"); }
"while" { printf("Palabra reservada: WHILE\n"); }
"for" { printf("Palabra reservada: FOR\n"); }
"int" { printf("Palabra reservada: INT\n"); }
"float" { printf("Palabra reservada: FLOAT\n"); }
"double" { printf("Palabra reservada: DOUBLE\n"); }
"do" { printf("Palabra reservada: DO\n"); }
"main" { printf("Palabra reservada: MAIN\n"); }

{VARIABLE} { printf ("Variable detectada: %s\n",yytext); }

{NUMERO} { printf ("Constante numerica detectada: %s\n",yytext); }

{OPERADOR_ART} { printf ("Operador aritmetico: %s\n",yytext);}

{COMENTARIO1} { printf("Comentarios: %s\n",yytext);}

{COMENTARIO2} { printf("Comentarios: %s\n",yytext);}

{OP_LOGICOS}     { printf("OPERADOR LOGICO: %s\n", yytext); }

[ \t\n]+ {}
. { printf("Simbolos Especiales: %s\n", yytext); }
%%

int main()
{
	FILE *file = fopen("codigo.txt","r");

	if (!file) {
		printf("Ocurrió un error al abrir el archivo.\n");
		return 1;
	}

	yyin = file;
	yylex();
	
	printf("\nTotal de comentarios encontrados: %d\n", cont);

	fclose(file);
	return 0;
}
/* Para ejecutar en cmd
> flex text.l
> cc lex.yy.c
> text1.exe
*/