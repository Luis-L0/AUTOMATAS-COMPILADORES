#include <stdio.h>
#include <ctype.h>

int main() {
    char cadena[200];
    int i = 0, j = 0;

    // Contadores 
    int contador_enteros = 0;
    int contador_caracteres = 0;
    int contador_palabras = 0;
    int contador_compuestas = 0;

    printf("Ingrese una oracion: ");
    fgets(cadena, sizeof(cadena), stdin);

    while (cadena[i] != '\0' && cadena[i] != '\n') {
        char palabra[50];
        j = 0;

        // 
        while (cadena[i] != ' ' && cadena[i] != '\0' && cadena[i] != '\n') {
            palabra[j++] = cadena[i++];
        }
        palabra[j] = '\0';  // 

        if (j > 0) { // 
            int k = 0, solo_digitos = 1, solo_letras = 1;

            // 
            while (palabra[k] != '\0') {
                if (!isdigit(palabra[k])) {
                    solo_digitos = 0;
                }
                if (!isalpha(palabra[k])) {
                    solo_letras = 0;
                }
                k++;
            }

            // 
            if (solo_digitos && !solo_letras) {
                printf("'%s' -> NUMERO ENTERO\n", palabra);
                contador_enteros++;
            } 
            else if (solo_letras && !solo_digitos) {
                if (j == 1) {
                    printf("'%s' -> CARACTER\n", palabra);
                    contador_caracteres++;
                } else {
                    printf("'%s' -> PALABRA\n", palabra);
                    contador_palabras++;
                }
            } 
            else {
                printf("'%s' -> COMPUESTA\n", palabra);
                contador_compuestas++;
            }
        }

        // 
        if (cadena[i] == ' ')
            i++;
    }

    // 
    printf("\n--- Datos ---\n");
    printf("Numeros enteros: %d\n", contador_enteros);
    printf("Caracteres: %d\n", contador_caracteres);
    printf("Palabras: %d\n", contador_palabras);
    printf("Compuestas: %d\n", contador_compuestas);

    return 0;
}
