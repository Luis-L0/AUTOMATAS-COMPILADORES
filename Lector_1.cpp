#include <stdio.h>
#include <ctype.h>

int main() {
    char cadena[200];
    int i = 0, j = 0;

    printf("Ingrese una oracion: ");
    fgets(cadena, sizeof(cadena), stdin);

    while (cadena[i] != '\0' && cadena[i] != '\n') {
        char palabra[50];
        j = 0;

        // 
        while (cadena[i] != ' ' && cadena[i] != '\0' && cadena[i] != '\n') {
            palabra[j++] = cadena[i++];
        }
        palabra[j] = '\0'; 

        if (j > 0) { //
            int k = 0, solo_digitos = 1, solo_letras = 1;

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
            } 
            else if (solo_letras && !solo_digitos) {
                if (j == 1)
                    printf("'%s' -> CARACTER\n", palabra);
                else
                    printf("'%s' -> PALABRA\n", palabra);
            } 
            else {
                printf("'%s' -> COMPUESTA\n", palabra);
            }
        }

        // 
        if (cadena[i] == ' ')
            i++;
    }

    return 0;
}
