include <../CustomBox.scad>

largo=120;//minimo 80
ancho=60;//minimo 20
alto=30;//minimo 10
grosor=2;//minimo 1
partes=1;//1-caja y tapa  - 2 solo caja - 3 solo tapa
bisagras=2;//minimo 1 maximo 3
pasador=true;//

makeBox(ancho,largo,alto,grosor,partes,bisagras,pasador);