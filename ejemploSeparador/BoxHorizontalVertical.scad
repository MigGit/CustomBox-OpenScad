include <../CustomBox.scad>

largo=120;//minimo 80
ancho=60;//minimo 20
alto=30;//minimo 10
grosor=2;//minimo 1

makeBox(ancho,largo,alto,grosor);

module separador(an,la,al,gro){
    sepH(an,la/2,al,gro,30,20);

    sepV(an,la,al,gro,30,20);
    sepV(an,la,al,gro,90,20);
}