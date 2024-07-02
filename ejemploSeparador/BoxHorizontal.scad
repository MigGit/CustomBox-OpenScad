include <../CustomBox.scad>

largo=120;//minimo 80
ancho=60;//minimo 20
alto=30;//minimo 10
grosor=2;//minimo 1

makeBox(ancho,largo,alto,grosor);

module separador(an,la,al,gro){
    sepH(an,la,al,gro,15,20);
    sepH(an,la,al,gro,30);//maxima altura
    sepH(an,la,al,gro,45,20);
}