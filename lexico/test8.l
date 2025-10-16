%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}

VERBOS_APLICACION [[Aa]plicar|[Cc]alcular|[Cc]ambiar|[Cc]omprobar|[Cc]omputar|[Cc]ontrastar|[Cc]onstruir|[Cc]onvertir|[Dd]emostrar|[Dd]esarrollar|[Dd]ibujar|[Dd]ramatizar|[Ee]jemplificar|[Ee]mplear|[Ee]nsamblar|[Ee]ntrevistar|[Ee]scoger|[Ee]stimar|[Ee]xtrapolar|[Ff]abricar|[Ff]uncionar|[Hh]acer\suso\sde|[Ii]lustrar|[Ii]nterpolar|[Ii]nterpretar|[Mm]anipular|[Mm]odelar|[Mm]odificar|[Mm]ostrar|[Oo]perar|[Oo]rganizar|[Pp]arear|[Pp]lanear|[Pp]racticar|[Pp]reparar|[Pp]roducir|[Pp]rogramar|[Rr]ealizar|[Rr]edactar|[Rr]esolver|[Tt]raducir|[Uu]sar|[Uu]tilizar]

%%

{VERBOS_APLICACION} { 
    printf("VERBO_APLICACION ENCONTRADO: -> %s\n", yytext);
}

.|\n {  }

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