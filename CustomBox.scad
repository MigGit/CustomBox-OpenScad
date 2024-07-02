

/* ======================================
    CustomBox
    https://github.com/MigGit/CustomBox-OpenScad
    
  Archivo para OpenScad para generar caja con todas sus partes, incluye ejemplos
   
  Copyright (c) 2023 MigSoft. Distribuido bajo GPLv3, consulte LICENCIA para conocer los términos.
========================================== */

include <src/caja.scad>
include <src/tapa.scad>


/**
Definición de parámetros de entrada
    ancho: Ancho de la caja. Mínimo 20 mm.
    largo: Largo de la caja. Para 2 o 3 bisagras mínimo 80 mm. Para 1 bisagra mínimo 30 mm.
    alto: Alto de la caja, mínimo 10 mm.
    grosor: grosor de la pared.
    modo: Valor para seleccionar las parte. 1 caja y tapa, 2 solo caja, 3 solo tapa (cualquier otro valor no muestra ninguna parte). Por defecto 1.
    bisagras: Cantidad de bisagras 1, 2 o 3 como máximo. Por defecto 1.
    pasadores: Mientras o no pasadores, por defecto los muestra.
**/
module makeBox(ancho,largo,alto,grosor,modo=1,bisagras=1,pasadores=true){
    if(modo==1){
        caja(ancho,largo,alto,grosor,bisagras);
        tapa(ancho,largo,grosor,bisagras);
    }else if(modo==2){
        caja(ancho,largo,alto,grosor,bisagras);
    }else if(modo==3){
        tapa(ancho,largo,grosor,bisagras);
    }

    if(pasadores){
        if(bisagras==1||bisagras==3){
            pasador();
        }
        if(bisagras==2||bisagras==3){
            translate([0,largo/2/2,0])
            pasador();

            translate([0,-largo/2/2,0])
            pasador();
        }
    }
}


module pasador(){
    cylinder(h=8*3+2, d=3.7, $fn=50, center=false);
    cylinder(h=2, d=5, $fn=50, center=false);
}