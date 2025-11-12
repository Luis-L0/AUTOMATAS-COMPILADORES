%option noyywrap
%{
	#include <stdio.h>
	#include <string.h>
	#include <ctype.h>

	FILE *yyin;

	int lineas = 1;
	int palabras = 0;
	int caracteres = 0;
	int palabras_ni = 0;
	int palabras_num = 0;
	int palabras_b_to = 0;
	int palabras_jo = 0;
	int numeros = 0;
	int total_digits = 0;
	int total_carac = 0;

	void imprimirResultados() {
		printf("Resultados:\\n");
		printf("Total de líneas: %d\n", lineas);
		printf("Total de palabras: %d\n", palabras);
		printf("Total de caracteres (bytes contados por flex): %d\n", caracteres);
		printf("Total de palabras que inician con \"ni\": %d\n", palabras_ni);
		printf("Total de palabras que inician con \"núm\"/\"num\": %d\n", palabras_num);
		printf("Total de palabras que inician con \"b\" y terminan con \"to\": %d\n", palabras_b_to);
		printf("Total de palabras que terminan con \"jo\": %d\n", palabras_jo);
		printf("Total de tokens que son dígitos: %d\n", numeros);
		printf("Total de dígitos (suma de longitudes de tokens numéricos): %d\n", total_digits);
		printf("Total de caracteres contabilizados (otra variable): %d\n", total_carac);
	}
%}

%%

\n              { lineas++; caracteres += yyleng; total_carac += yyleng; }

[ \t\r]+        { caracteres += yyleng; total_carac += yyleng; }

[0-9]+          { numeros++; total_digits += yyleng; palabras++; caracteres += yyleng; total_carac += yyleng; }


([Nn]([uU]|\xC3\xBA|\xC3\x9A)[mM][A-Za-z\x80-\xFF]*)  {
                    palabras++;
                    palabras_num++;
                    caracteres += yyleng;
                    total_carac += yyleng;
                }

([Nn][iI][A-Za-z\x80-\xFF]*) {
                    palabras++;
                    palabras_ni++;
                    caracteres += yyleng;
                    total_carac += yyleng;
                }

([Bb][A-Za-z\x80-\xFF]*[tT][oO]) {
                    palabras++;
                    palabras_b_to++;
                    caracteres += yyleng;
                    total_carac += yyleng;
                }

([A-Za-z\x80-\xFF]*[jJ][oO]) {
                    palabras++;
                    palabras_jo++;
                    caracteres += yyleng;
                    total_carac += yyleng;
                }

[A-Za-z\x80-\xFF]+    {
                    palabras++;
                    caracteres += yyleng;
                    total_carac += yyleng;
                }

.               { caracteres += yyleng; total_carac += yyleng; }

%%

int main() {
	yyin = fopen("elbrutodelasmates.txt", "r");
	if (!yyin) {
		perror("No se pudo abrir elbrutodelasmates.txt");
		return 1;
	}
	yylex();

	imprimirResultados();

	fclose(yyin);
	return 0;
}
