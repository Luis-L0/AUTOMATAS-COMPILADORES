%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>

    FILE *yyin;
    FILE *salida;

    /* Lista extendida de palabras vacías comunes en español */
    char *palabras_vacias[] = {
        /* Artículos */
        "el", "la", "los", "las", "un", "una","unos", "unas",

        /* Preposiciones */
        "de", "del", "al", "a", "ante", "bajo", "cabe", "con", "contra", "en",
        "entre", "hacia", "hasta", "para", "por", "según", "sin", "sobre",
        "tras", "desde", "durante", "iba",

        /* Conjunciones y conectores */
        "y", "o", "u", "ni", "que", "como", "aunque", "cuando", "donde","cada"
        "mientras", "porque", "si", "sino", "ya_que", "puesto_que",
        "tan_pronto_como", "pues", "entonces", "pero", "además", "sin_embargo",
        "también", "aunque", "aunque", "así_que", "alguna",

        /* Pronombres y posesivos */
        "su", "sus", "mi", "mis", "tu", "tus", "nuestro", "nuestra",
        "nuestros", "nuestras", "vuestro", "vuestra", "vuestros", "vuestras",
        "lo", "se", "le", "les", "te", "me", "nos", "os", "él", "ella", "ellos", "ellas",

        /* Adverbios comunes */
        "ya", "no", "sí", "más", "muy", "tan", "también", "aún", "solo",
        "solamente", "nunca", "siempre", "casi", "apenas", "entonces",
        "ahora", "después", "antes", "aquí", "allí", "allá", "acá", "ahí",
        "luego", "además", "así", "pues", "hoy", "ayer", "mañana", "todavía",

        /* Demostrativos */
        "ese", "esa", "eso", "esos", "esas", "este", "esta", "estos", "estas",
        "aquel", "aquella", "aquellos", "aquellas",

        /* Verbos comunes y auxiliares */
        "ser", "estar", "haber", "tener", "hacer", "decir", "poder", "ir", "ver",
        "dar", "saber", "querer", "deber", "venir", "era", "fue", "fueron",
        "había", "estaba", "estaban", "soy", "eres", "es", "son", "somos",
        "estoy", "estás", "están", "he", "ha", "han",

        /* Interjecciones */
        "eh", "ay", "oh", "uy", "vaya", "bueno", "vale",

        NULL
    };

    /* Función para pasar todo a minúsculas */
    void to_lowercase(char *str) {
        int i;
        for (i = 0; str[i]; i++) {
            str[i] = tolower(str[i]);
        }
    }

    /* Función que comprueba si una palabra está en la lista */
    int es_palabra_vacia(const char *palabra) {
        int i;
        for (i = 0; palabras_vacias[i] != NULL; i++) {
            if (strcmp(palabra, palabras_vacias[i]) == 0)
                return 1;
        }
        return 0;
    }
%}

%%

[a-zA-ZáéíóúÁÉÍÓÚñÑ_]+ {
    char palabra[100];
    strcpy(palabra, yytext);
    to_lowercase(palabra);

    if (!es_palabra_vacia(palabra)) {
        fprintf(salida, "%s ", palabra);  /* Guarda solo palabras no vacías */
        printf("%s ", palabra);           /* Muestra también en consola */
    }
}

[ \t\n]+    { fprintf(salida, " "); }   /* Mantiene separación */
.           ;                           /* Ignora signos de puntuación */

%%

int main()
{
    yyin = fopen("Asesinofamiliar.txt", "r");
    if (!yyin) {
        perror("No se pudo abrir Asesinofamiliar.txt");
        return 1;
    }

    salida = fopen("Nuevo.txt", "w");
    if (!salida) {
        perror("No se pudo crear Nuevo.txt");
        fclose(yyin);
        return 1;
    }

    printf("Eliminando palabras vacías...\n\n");
    yylex();
    printf("\n\nProceso completado. Resultado guardado en Nuevo.txt\n");

    fclose(yyin);
    fclose(salida);
    return 0;
}
