%option noyywrap

%{
#include<stdio.h>
#include<string.h>

int chuta = 0;
int lodero = 0;
int chagra = 0;
int choclos = 0;
int ollocos = 0;
int chumado = 0;
int aljibe = 0;
int entundarse = 0;
int chapil = 0;
int chagras = 0;
int marraneras = 0;
int cuyeras = 0;
int desgualangado = 0;
int emberracado = 0;
int chalina = 0;
int empantanada = 0;
int barones = 0;
int charuco = 0;
int chancuco = 0;
int taitas = 0;
int guaguas = 0;
int baroncitos = 0;
int zurron = 0;
int pomas = 0;
int enruanados = 0;
int azaroso = 0;
int bramo = 0;
int manga = 0;
int bambarito = 0;
int enajenacion = 0;
int tuste = 0;

int total_regionalismos = 0;
FILE *archivo_salida;

void imprimirResultados();
char* obtenerReemplazo(const char* palabra);

%}

AcentoA [áÁ\xC3\xA1\xC3\x81]
AcentoE [éÉ\xC3\xA9\xC3\x89]
AcentoI [íÍ\xC3\xAD\xC3\x8D]
AcentoO [óÓ\xC3\xB3\xC3\x93]
AcentoU [úÚ\xC3\xBA\xC3\x9A]
ENye [ñÑ\xC3\xB1\xC3\x91]

Letra [a-zA-Z{AcentoA}{AcentoE}{AcentoI}{AcentoO}{AcentoU}{ENye}]

%%

[Cc][Hh][Uu][Tt][Aa] { 
    chuta++; 
    total_regionalismos++;
    printf("Reemplazado: 'chuta' -> 'suerte'\n");
    fprintf(archivo_salida, "suerte");
}

[Ll][Oo][Dd][Ee][Rr][Oo] { 
    lodero++; 
    total_regionalismos++;
    printf("Reemplazado: 'lodero' -> 'desordenado'\n");
    fprintf(archivo_salida, "desordenado");
}

[Cc][Hh][Aa][Gg][Rr][Aa] { 
    chagra++; 
    total_regionalismos++;
    printf("Reemplazado: 'chagra' -> 'campesino'\n");
    fprintf(archivo_salida, "campesino");
}

[Cc][Hh][Oo][Cc][Ll][Oo][Ss] { 
    choclos++; 
    total_regionalismos++;
    printf("Reemplazado: 'choclos' -> 'maíz'\n");
    fprintf(archivo_salida, "maíz");
}

[Oo][Ll][Ll][Oo][Cc][Oo][Ss] { 
    ollocos++; 
    total_regionalismos++;
    printf("Reemplazado: 'ollocos' -> 'papas'\n");
    fprintf(archivo_salida, "papas");
}

[Cc][Hh][Uu][Mm][Aa][Dd][Oo] { 
    chumado++; 
    total_regionalismos++;
    printf("Reemplazado: 'chumado' -> 'borracho'\n");
    fprintf(archivo_salida, "borracho");
}

[Aa][Ll][Jj][Ii][Bb][Ee] { 
    aljibe++; 
    total_regionalismos++;
    printf("Reemplazado: 'aljibe' -> 'depósito de agua'\n");
    fprintf(archivo_salida, "depósito de agua");
}

[Ee][Nn][Tt][Uu][Nn][Dd][Aa][Rr][Ss][Ee] { 
    entundarse++; 
    total_regionalismos++;
    printf("Reemplazado: 'entundarse' -> 'confundirse'\n");
    fprintf(archivo_salida, "confundirse");
}

[Cc][Hh][Aa][Pp][Ii][Ll] { 
    chapil++; 
    total_regionalismos++;
    printf("Reemplazado: 'chapíl' -> 'sombrero'\n");
    fprintf(archivo_salida, "sombrero");
}

[Cc][Hh][Aa][Gg][Rr][Aa][Ss] { 
    chagras++; 
    total_regionalismos++;
    printf("Reemplazado: 'chagras' -> 'campesinos'\n");
    fprintf(archivo_salida, "campesinos");
}

[Mm][Aa][Rr][Rr][Aa][Nn][Ee][Rr][Aa][Ss] { 
    marraneras++; 
    total_regionalismos++;
    printf("Reemplazado: 'marraneras' -> 'porquerizas'\n");
    fprintf(archivo_salida, "porquerizas");
}

[Cc][Uu][Yy][Ee][Rr][Aa][Ss] { 
    cuyeras++; 
    total_regionalismos++;
    printf("Reemplazado: 'cuyeras' -> 'conejeras'\n");
    fprintf(archivo_salida, "conejeras");
}

[Dd][Ee][Ss][Gg][Uu][Aa][Ll][Aa][Nn][Gg][Aa][Dd][Oo] { 
    desgualangado++; 
    total_regionalismos++;
    printf("Reemplazado: 'desgualangado' -> 'desgarbado'\n");
    fprintf(archivo_salida, "desgarbado");
}

[Ee][Mm][Bb][Ee][Rr][Rr][Aa][Cc][Aa][Dd][Oo] { 
    emberracado++; 
    total_regionalismos++;
    printf("Reemplazado: 'emberracado' -> 'enfadado'\n");
    fprintf(archivo_salida, "enfadado");
}

[Cc][Hh][Aa][Ll][Ii][Nn][Aa] { 
    chalina++; 
    total_regionalismos++;
    printf("Reemplazado: 'chalina' -> 'bufanda'\n");
    fprintf(archivo_salida, "bufanda");
}

[Ee][Mm][Pp][Aa][Nn][Tt][Aa][Nn][Aa][Dd][Aa] { 
    empantanada++; 
    total_regionalismos++;
    printf("Reemplazado: 'empantanada' -> 'estancada'\n");
    fprintf(archivo_salida, "estancada");
}

[Bb][Aa][Rr][Oo][Nn][Ee][Ss] { 
    barones++; 
    total_regionalismos++;
    printf("Reemplazado: 'barones' -> 'señores'\n");
    fprintf(archivo_salida, "señores");
}

[Cc][Hh][Aa][Rr][Uu][Cc][Oo] { 
    charuco++; 
    total_regionalismos++;
    printf("Reemplazado: 'charuco' -> 'terreno'\n");
    fprintf(archivo_salida, "terreno");
}

[Cc][Hh][Aa][Nn][Cc][Uu][Cc][Oo] { 
    chancuco++; 
    total_regionalismos++;
    printf("Reemplazado: 'chancuco' -> 'dulce'\n");
    fprintf(archivo_salida, "dulce");
}

[Tt][Aa][Ii][Tt][Aa][Ss] { 
    taitas++; 
    total_regionalismos++;
    printf("Reemplazado: 'taitas' -> 'padres'\n");
    fprintf(archivo_salida, "padres");
}

[Gg][Uu][Aa][Gg][Uu][Aa][Ss] { 
    guaguas++; 
    total_regionalismos++;
    printf("Reemplazado: 'guaguas' -> 'niños'\n");
    fprintf(archivo_salida, "niños");
}

[Bb][Aa][Rr][Oo][Nn][Cc][Ii][Tt][Oo][Ss] { 
    baroncitos++; 
    total_regionalismos++;
    printf("Reemplazado: 'baroncitos' -> 'jóvenes'\n");
    fprintf(archivo_salida, "jóvenes");
}

[Zz][Uu][Rr][Rr][Oo][Nn] { 
    zurron++; 
    total_regionalismos++;
    printf("Reemplazado: 'zurrón' -> 'mochila'\n");
    fprintf(archivo_salida, "mochila");
}

[Pp][Oo][Mm][Aa][Ss] { 
    pomas++; 
    total_regionalismos++;
    printf("Reemplazado: 'pomas' -> 'manzanas'\n");
    fprintf(archivo_salida, "manzanas");
}

[Ee][Nn][Rr][Uu][Aa][Nn][Aa][Dd][Oo][Ss] { 
    enruanados++; 
    total_regionalismos++;
    printf("Reemplazado: 'enruanados' -> 'abrigados'\n");
    fprintf(archivo_salida, "abrigados");
}

[Aa][Zz][Aa][Rr][Oo][Ss][Oo] { 
    azaroso++; 
    total_regionalismos++;
    printf("Reemplazado: 'azaroso' -> 'arriesgado'\n");
    fprintf(archivo_salida, "arriesgado");
}

[Bb][Rr][Aa][Mm][Oo] { 
    bramo++; 
    total_regionalismos++;
    printf("Reemplazado: 'bramo' -> 'grito'\n");
    fprintf(archivo_salida, "grito");
}

[Mm][Aa][Nn][Gg][Aa] { 
    manga++; 
    total_regionalismos++;
    printf("Reemplazado: 'manga' -> 'grupo'\n");
    fprintf(archivo_salida, "grupo");
}

[Bb][Aa][Mm][Bb][Aa][Rr][Ii][Tt][Oo] { 
    bambarito++; 
    total_regionalismos++;
    printf("Reemplazado: 'bambarito' -> 'elegante'\n");
    fprintf(archivo_salida, "elegante");
}

[Ee][Nn][Aa][Jj][Ee][Nn][Aa][Cc][Ii][Oo][Nn] { 
    enajenacion++; 
    total_regionalismos++;
    printf("Reemplazado: 'enajenación' -> 'locura'\n");
    fprintf(archivo_salida, "locura");
}

[Tt][Uu][Ss][Tt][Ee] { 
    tuste++; 
    total_regionalismos++;
    printf("Reemplazado: 'tuste' -> 'golpe'\n");
    fprintf(archivo_salida, "golpe");
}

{ 
    fputc(yytext[0], archivo_salida); 
}

%%

void imprimirResultados() {
    printf("\n" "="*60 "\n");
    printf("PROCESAMIENTO COMPLETADO - REGIONALISMOS COLOMBIANOS\n");
    printf("="*60 "\n");
    
    printf("\n REGIONALISMOS REEMPLAZADOS:\n");
    printf("-"*40 "\n");
    
    if(chuta > 0) printf("• chuta -> suerte: %d\n", chuta);
    if(lodero > 0) printf("• lodero -> desordenado: %d\n", lodero);
    if(chagra > 0) printf("• chagra -> campesino: %d\n", chagra);
    if(choclos > 0) printf("• choclos -> maíz: %d\n", choclos);
    if(ollocos > 0) printf("• ollocos -> papas: %d\n", ollocos);
    if(chumado > 0) printf("• chumado -> borracho: %d\n", chumado);
    if(aljibe > 0) printf("• aljibe -> depósito de agua: %d\n", aljibe);
    if(entundarse > 0) printf("• entundarse -> confundirse: %d\n", entundarse);
    if(chapil > 0) printf("• chapíl -> sombrero: %d\n", chapil);
    if(chagras > 0) printf("• chagras -> campesinos: %d\n", chagras);
    if(marraneras > 0) printf("• marraneras -> porquerizas: %d\n", marraneras);
    if(cuyeras > 0) printf("• cuyeras -> conejeras: %d\n", cuyeras);
    if(desgualangado > 0) printf("• desgualangado -> desgarbado: %d\n", desgualangado);
    if(emberracado > 0) printf("• emberracado -> enfadado: %d\n", emberracado);
    if(chalina > 0) printf("• chalina -> bufanda: %d\n", chalina);
    if(empantanada > 0) printf("• empantanada -> estancada: %d\n", empantanada);
    if(barones > 0) printf("• barones -> señores: %d\n", barones);
    if(charuco > 0) printf("• charuco -> terreno: %d\n", charuco);
    if(chancuco > 0) printf("• chancuco -> dulce: %d\n", chancuco);
    if(taitas > 0) printf("• taitas -> padres: %d\n", taitas);
    if(guaguas > 0) printf("• guaguas -> niños: %d\n", guaguas);
    if(baroncitos > 0) printf("• baroncitos -> jóvenes: %d\n", baroncitos);
    if(zurron > 0) printf("• zurrón -> mochila: %d\n", zurron);
    if(pomas > 0) printf("• pomas -> manzanas: %d\n", pomas);
    if(enruanados > 0) printf("• enruanados -> abrigados: %d\n", enruanados);
    if(azaroso > 0) printf("• azaroso -> arriesgado: %d\n", azaroso);
    if(bramo > 0) printf("• bramo -> grito: %d\n", bramo);
    if(manga > 0) printf("• manga -> grupo: %d\n", manga);
    if(bambarito > 0) printf("• bambarito -> elegante: %d\n", bambarito);
    if(enajenacion > 0) printf("• enajenación -> locura: %d\n", enajenacion);
    if(tuste > 0) printf("• tuste -> golpe: %d\n", tuste);
    
    printf("\n TOTAL: %d regionalismos reemplazados\n", total_regionalismos);
    
    if(total_regionalismos == 0) {
        printf("\nNo se encontraron regionalismos colombianos en el texto.\n");
    } else {
        printf("\n El archivo ha sido procesado y los regionalismos han sido reemplazados.\n");
        printf("   Archivo de salida generado: 'texto_universal.txt'\n");
    }
    
    printf("="*60 "\n");
}

int main(int argc, char *argv[]) {
    if(argc < 2) {
        printf("Uso: %s <archivo_entrada>\n", argv[0]);
        printf("Ejemplo: %s texto_colombiano.txt\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) {
        fprintf(stderr, "Error: No se pudo abrir el archivo '%s'\n", argv[1]);
        return 1;
    }
    
    archivo_salida = fopen("texto_universal.txt", "w");
    if(archivo_salida == NULL) {
        fprintf(stderr, "Error: No se pudo crear el archivo de salida\n");
        fclose(yyin);
        return 1;
    }
    
    printf("Procesando archivo: %s\n", argv[1]);
    printf("Reemplazando regionalismos colombianos...\n\n");
    
    yylex();
    
    fclose(yyin);
    fclose(archivo_salida);
    
    imprimirResultados();
    
    return 0;
}