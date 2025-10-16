%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}

VERBOS_ANALISIS ([Aa]nalizar|[Aa]sociar|[Aa]sumir|[Cc]alcular|[Cc]ategorizar|[Cc]lasificar|[Cc]omparar|[Cc]omponer|[Cc]oncluir|[Cc]ontrastar|[Cc]uestionar|[Cc]riticar|[Dd]escubrir|[Dd]esmenuzar|[Dd]estacar|[Dd]ibujar|[Dd]iagramar|[Dd]iferenciar|[Dd]iscutir|[Dd]iscriminar|[Dd]isecar|[Dd]istinguir|[Dd]ividir|[Ee]legir|[Ee]ncuestar|[Ee]nsamblar|[Ee]stimar|[Ee]xaminar|[Ee]xperimentar|[Ee]xplicar|[Ii]nspeccionar|[Ss]ubdividir)


ADJETIVOS ([Aa]legr[eao]|[Aa]gradable|[Bb]ueno|[Bb]ella|[Cc]apaz|[Cc]reativo|[Ee]xcelente|[Ee]ficiente|[Ee]special|[Ff]antástico|[Gg]eniales|[Hh]ábil|[Ii]ncreíble|[Jj]usto|[Ll]impio|[Ll]uminoso|[Mm]agnífico|[Mm]ejores|[Oo]ptimista|[Pp]erfecto|[Pp]ositivo|[Rr]adiante|[Rr]ico|[Ss]abio|[Ss]ano|[Ss]incero|[Tt]ranquil[oao]|[Vv]aliente|[Vv]igoroso)


CONJUNCIONES ([Yy]|[Ee]|[Nn]i|[Oo]|[Uu]|[Pp]ero|[Ss]ino|[Ss]in\s[Ee]mbargo|[Aa]unque|[Pp]orque|[Cc]uando|[Ss]i|[Cq][Uu]e)


PREPOSICIONES ([Aa]|[Aa]nte|[Bb]ajo|[Cc]abe|[Cc]on|[Cc]ontra|[Dd]e|[Dd]esde|[Dd]urante|[Ee]n|[Ee]ntre|[Hh]acia|[Hh]asta|[Mm]ediante|[Pp]ara|[Pp]or|[Ss]egún|[Ss]in|[Ss]obre|[Tt]ras|[Vv]ía)


PRONOMBRES ([Yy]o|[Tt][u]|[Ee]l|[Ee]lla|[Uu]sted|[Nn]osotros|[Vv]osotros|[Ee]llos|[Ee]llas|[Uu]stedes|[Mm][i]|[Tt][i]|[Ss][i]|[Nn]os|[Oo]s|[Ll]o|[Ll]a|[Ll]os|[Ll]as|[Ll]es|[Lq][u]e|[Qq]uien|[Cg]ual|[Ee]st[eao]|[Aa]qu[ei]l)

%%
{VERBOS_ANALISIS} {printf ("VERBO_ANALISIS: %s\n",yytext);}

{ADJETIVOS} {printf ("ADJETIVO_POSITIVO: %s\n",yytext);}

{CONJUNCIONES} {printf ("CONJUNCION: %s\n",yytext);}

{PREPOSICIONES} {printf ("PREPOSICION: %s\n",yytext);}

{PRONOMBRES} {printf ("PRONOMBRE: %s\n", yytext);}

.|\n {}
%%

int main()
{
        FILE *file_7;
	char name [] = "bloom.txt";
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