%{
#include <stdio.h>
#include <string.h>

int total_colombianos = 0;

struct Palabra {
    char *texto;
    int contador;
} palabras[] = {
    {"chuta", 0}, {"lodero", 0}, {"chagra", 0}, {"choclos", 0}, {"ollocos", 0},
    {"chumado", 0}, {"aljibe", 0}, {"entundarse", 0}, {"chapíl", 0}, {"chapil", 0},
    {"chagras", 0}, {"marraneras", 0}, {"cuyeras", 0}, {"desgualangado", 0},
    {"emberracado", 0}, {"chalina", 0}, {"empantanada", 0}, {"barones", 0},
    {"charuco", 0}, {"chancuco", 0}, {"Taitas", 0}, {"guaguas", 0},
    {"baroncitos", 0}, {"zurrón", 0}, {"pomas", 0}, {"enruanados", 0},
    {"azaroso", 0}, {"bramo", 0}, {"manga", 0}, {"bambarito", 0},
    {"enajenación", 0}, {"tuste", 0}
};

int N_PALABRAS = 31;

void contar_palabra(const char *lexema) {
    int i;
    for (i = 0; i < N_PALABRAS; i++) {
        if (strcasecmp(lexema, palabras[i].texto) == 0) {
            palabras[i].contador++;
            total_colombianos++;
            break;
        }
    }
}
%}

%option noyywrap

PALABRA_COLOM    (chuta|lodero|chagra|choclos|ollocos|chumado|aljibe|entundarse|chapíl|chapil|chagras|marraneras|cuyeras|desgualangado|emberracado|chalina|empantanada|barones|charuco|chancuco|Taitas|guaguas|baroncitos|zurrón|pomas|enruanados|azaroso|bramo|manga|bambarito|enajenación|tuste)

%%

{PALABRA_COLOM}   { contar_palabra(yytext); }

%%

int main(void) {
    FILE *archivo = fopen("cuento.txt", "r");
    if (!archivo) {
        perror("Error al abrir cuento.txt");
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);

    printf("\n===== RESULTADOS =====\n");
    int i;
    for (i = 0; i < N_PALABRAS; i++) {
        if (palabras[i].contador > 0)
            printf("%-15s : %d\n", palabras[i].texto, palabras[i].contador);
    }

    printf("\nTotal de regionalismos colombianos encontrados: %d\n", total_colombianos);
    return 0;
}
