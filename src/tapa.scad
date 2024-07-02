include <comunes.scad>

module tapa(an,la,go,bi){
    //definiciones
    cgo=go*2;
    altoTapa=10;
    separa=20;
    anchB=8;
    //base
    translate([separa,-la/2,0])
    difference(){
        union(){
            base(an,la,altoTapa);
            translate([cgo/2,cgo/2,0])
            base(an-cgo,la-cgo,altoTapa+1);
        }
        
        translate([cgo/2+1,cgo/2+1,cgo/2])
        base(an-cgo-2,la-cgo-2,altoTapa+2);
    } 
    //bisagras
    if(bi==2||bi==3){
        mm=(la/2)-14;
        translate([24,mm,1.5])
        mirror([1,0,0])
        bisagra(altoTapa,anchB/2,anchB);
        
        //translate([0,-mm,1.5])
        translate([24,-mm,1.5])
        mirror([1,0,0])
        bisagra(altoTapa,anchB/2,anchB);
    }
    if(bi==1||bi==3){
        mm=0;//(an/2);
        translate([24,mm,1.5])
        mirror([1,0,0])
        bisagra(altoTapa,anchB/2,anchB);
    }
    
    //bestillo
    translate([separa+an+3,0,0])
    bestilloTapa();
}

module bestilloTapa(){
    rotate([0,0,90])
    difference(){
        baseBestillo();
        translate([-5,0,16.5])
        hull() {
            translate([10,0,0]) 
            sphere(d = 6, $fn=50);
            sphere(d = 6, $fn=50);
        }
        
        translate([-18,-3,-5])
        cube([35,6,5]);
        
        translate([-18,1,-1])
        cube([35,5,26]);
    }
}

module baseBestillo(){
    difference(){
        rotate([0,0,45])
        cylinder(20,20,10,$fn=4);
        
        translate([-15,2,-1])
        cube([30,20,26]);
        
        translate([-15,-22,-1])
        cube([30,20,26]);
    }

    translate([15,0,0])
    hull() {
        translate([-7,0,20]) 
        sphere(d = 4, $fn=50);
        sphere(d = 4, $fn=50);
    }

    translate([-15,0,0])
    hull() {
        translate([7,0,20]) 
        sphere(d = 4, $fn=50);
        sphere(d = 4, $fn=50);
    }

    translate([-8,0,20])
    hull() {
        translate([16,0,0]) 
        sphere(d = 4, $fn=50);
        sphere(d = 4, $fn=50);
    }
}