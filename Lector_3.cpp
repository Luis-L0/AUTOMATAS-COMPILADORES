#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    FILE *archivo;
    char cadena[1000];  
    int i = 0, j = 0;

    
    int contador_enteros = 0;
    int contador_palabras = 0;
    int contador_compuestas = 0;
    int total_caracteres = 0;
    int total_sin_espacios = 0;
    int total_lexemas = 0;

    
    archivo = fopen("entrada.txt", "r");
    if (archivo == NULL) {
        printf("Error: no se pudo abrir el archivo.\n");
        return 1;
    }

    
    fread(cadena, sizeof(char), sizeof(cadena) - 1, archivo);
    fclose(archivo);

    
    total_caracteres = strlen(cadena);

    
    for (int k = 0; cadena[k] != '\0'; k++) {
        if (cadena[k] != ' ' && cadena[k] != '\n' && cadena[k] != '\t')
            total_sin_espacios++;
    }

   
    while (cadena[i] != '\0') {
        char palabra[100];
        j = 0;

        
        while (cadena[i] != ' ' && cadena[i] != '\n' && cadena[i] != '\t' && cadena[i] != '\0') {
            palabra[j++] = cadena[i++];
        }
        palabra[j] = '\0';

        if (j > 0) { 
            int k = 0, solo_digitos = 1, solo_letras = 1;

            while (palabra[k] != '\0') {
                if (!isdigit(palabra[k]))
                    solo_digitos = 0;
                if (!isalpha(palabra[k]))
                    solo_letras = 0;
                k++;
            }

            
            if (solo_digitos && !solo_letras) {
                contador_enteros++;
            } 
            else if (solo_letras && !solo_digitos) {
                contador_palabras++;
            } 
            else {
                contador_compuestas++;
            }

            total_lexemas++;
        }

        if (cadena[i] == ' ' || cadena[i] == '\n' || cadena[i] == '\t')
            i++;
    }

    
    printf("Total de caracteres (con espacios): %d\n", total_caracteres);
    printf("Total de caracteres (sin espacios): %d\n", total_sin_espacios);
    printf("Total de lexemas: %d\n", total_lexemas);
    printf("Total de palabras: %d\n", contador_palabras);
    printf("Total de numeros: %d\n", contador_enteros);
    printf("Total de combinadas: %d\n", contador_compuestas);

    return 0;
}
