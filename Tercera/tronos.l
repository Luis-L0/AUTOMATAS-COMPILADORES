%{
#include <stdio.h>
FILE *yyin;

int westeros=0, invernalia=0, desembarco=0, nido=0, altojardin=0;
int aguasdulces=0, rocadragon=0, roca=0, bastion=0, dorne=0;

int stark=0, arryn=0, tully=0, greyjoy=0, lannister=0, tyrell=0, martell=0, baratheon=0, targaryen=0;

int eddard=0, catelyn=0, arya=0, sansa=0;
int robert=0, joffrey=0, stannis=0;
int aegon=0, daenerys=0, aerys=0;
int tywin=0, jaime=0, tyrion=0, cersei=0;

int yywrap(void) { return 1; }
%}

%%
[wW]esteros                    { westeros++; }
[Ii]nvernalia                  { invernalia++; }
[Dd]esembarco[[:space:]]del[[:space:]]Rey   { desembarco++; }
[Nn]ido[[:space:]]de[[:space:]][Aa]guilas   { nido++; }
[Aa]ltojardin                  { altojardin++; }
[Aa]guasdulces                 { aguasdulces++; }
[Rr]ocadragon                  { rocadragon++; }
[Rr]oca[[:space:]]Casterly     { roca++; }
[Bb]astion[[:space:]]de[[:space:]]Tormentas { bastion++; }
[Dd]orne                       { dorne++; }

[Ss]tark        { stark++; }
[Aa]rryn        { arryn++; }
[Tt]ully        { tully++; }
[Gg]reyjoy      { greyjoy++; }
[Ll]annister    { lannister++; }
[Tt]yrell       { tyrell++; }
[Mm]artell      { martell++; }
[Bb]aratheon    { baratheon++; }
[Tt]argaryen    { targaryen++; }

[Ee]ddard       { eddard++; }
[Cc]atelyn      { catelyn++; }
[Aa]rya         { arya++; }
[Ss]ansa        { sansa++; }
[Rr]obert       { robert++; }
[Jj]offrey      { joffrey++; }
[Ss]tannis      { stannis++; }
[Aa]egon        { aegon++; }
[Dd]aenerys     { daenerys++; }
[Aa]erys        { aerys++; }
[Tt]ywin        { tywin++; }
[Jj]aime        { jaime++; }
[Tt]yrion       { tyrion++; }
[Cc]ersei       { cersei++; }
%%

int main() {
    FILE *file_7;
    char name[] = "juego_tronos.txt";

    file_7 = fopen(name, "r");
    if (!file_7) {
        printf("Ocurrio un error al abrir el archivo.\n");
        return 1;
    }

    yyin = file_7;
    yylex();
    fclose(file_7);

    printf("\n===== RESULTADOS DEL ANALISIS =====\n");

    printf("\n-- LUGARES --\n");
    printf("Westeros: %d\nInvernalia: %d\nDesembarco del Rey: %d\nNido de Aguilas: %d\nAltojardin: %d\nAguasdulces: %d\nRocadragon: %d\nRoca Casterly: %d\nBastion de Tormentas: %d\nDorne: %d\n",
           westeros, invernalia, desembarco, nido, altojardin, aguasdulces, rocadragon, roca, bastion, dorne);

    printf("\n-- CASAS --\n");
    printf("Stark: %d\nArryn: %d\nTully: %d\nGreyjoy: %d\nLannister: %d\nTyrell: %d\nMartell: %d\nBaratheon: %d\nTargaryen: %d\n",
           stark, arryn, tully, greyjoy, lannister, tyrell, martell, baratheon, targaryen);

    printf("\n-- PERSONAJES --\n");
    printf("Eddard: %d\nCatelyn: %d\nArya: %d\nSansa: %d\nRobert: %d\nJoffrey: %d\nStannis: %d\nAegon: %d\nDaenerys: %d\nAerys: %d\nTywin: %d\nJaime: %d\nTyrion: %d\nCersei: %d\n",
           eddard, catelyn, arya, sansa, robert, joffrey, stannis, aegon, daenerys, aerys, tywin, jaime, tyrion, cersei);
    return 0;
}