include <comunes.scad>

/**
    Definición de separador
    Valores que traen estas variables:
        ancho: Ancho total de caja
        largo: Largo total de caja
        alto: Alto total de caja
        grosor: Grosor de las paredes
**/
module separador(ancho,largo,alto,grosor){}


module caja(an,la,al,go,bi){
    //Definiciones
    cgo=go*2;   //Considera las el grosor en 3d
    separa=-20; //Separación entre caja y tapa
    anchB=8;    //Ancho de la bisagra
    
    //Base
    translate([-an+separa,-la/2,0])
    difference(){
        base(an,la,al);
        
        translate([cgo/2,cgo/2,cgo/2])
        base(an-cgo,la-cgo,al);
    }
    //Bisagras 2 - 3
    if(bi==2||bi==3){
        mm=(la/2)-14;
        translate([0,mm+anchB+.5,1.5])
        bisagra(al,separa,anchB);
        
        translate([0,mm-anchB-.5,1.5])
        bisagra(al,separa,anchB);
        
        translate([0,-mm+anchB+.5,1.5])
        bisagra(al,separa,anchB);
        
        translate([0,-mm-anchB-.5,1.5])
        bisagra(al,separa,anchB);
    }
    //Bisagras 1
    if(bi==1||bi==3){
        mm=0;//(an/2);
        translate([0,mm+anchB+.5,1.5])
        bisagra(al,separa,anchB);
        
        translate([0,mm-anchB-.5,1.5])
        bisagra(al,separa,anchB);
    }
    //Bestillo
    translate([separa-an-1,-5,al-4.5])
    difference(){
        hull() {
            translate([0,10,0]) 
            sphere(d = 6, $fn=50);
            sphere(d = 6, $fn=50);
        }
        translate([0,-3,-3])
        cube([4,16,6]);
    }
    //Enganches
    translate([separa-(an/2),-(la/2)-go-4,-.5])
    cunnaH();
    
    translate([separa-(an/2),(la/2)+go+2,0])
    cunna(.2);
    //Separadores
    separador(an,la,al,go);
}

module sepH(ancho,largo,alto,grosor,anSep,alSep=alto-1.5){
    assert(anSep<ancho&&anSep>-1, "El separador indicado sale del rango de la caja");
    
    translate([-20-anSep,-largo/2,0])
    cube([grosor,largo,alSep]);   
}

module sepV(ancho,largo,alto,grosor,anSep,alSep=alto-1.5){
    assert(anSep<largo&&anSep>-1, "El separador indicado sale del rango de la caja");
    
    translate([-20-ancho,(-largo/2-grosor)+anSep,0])
    cube([ancho,grosor,alSep]);   
}

module cunnaH(){
    difference(){
        $fn=50;
        minkowski()
        {
            translate([-4,0,.5])
            cube([8,2,5]);
            cylinder(r=2,h=1);
        }
        
        cunna();
    }
}


module cunna(c=0){
    CubePoints = [
      [  2-c,  0,  0 ],  //0
      [ 8-c,  0,  0 ],  //1
      [ 8-c,  7-c,  0 ],  //2
      [  2-c,  7-c,  0 ],  //3
      [  0,  0,  4-c ],  //4
      [ 10-c,  0,  4-c ],  //5
      [ 10-c,  7-c,  4-c ],  //6
      [  0,  7-c,  4-c ]]; //7
      
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
    translate([5-(c/2),-2+(c/2),0])
    rotate([90,0,180])
    polyhedron( CubePoints, CubeFaces );
    
    translate([-3+(c/2),-2.5+(c/2),0])
    cube([6+c-c,2,7-c]);
}