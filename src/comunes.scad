module base(an,la,al){
    difference(){
        $fn=50;
        minkowski()
        {
          cube([an,la,al],center=false);
          cylinder(r=2,h=1);
        }
        
    }
}

module bisagra(al,sep,anchB){
    diametro=12;
    pos=sep+8;
    translate([pos,0,al])
    rotate([90,0,0])
    difference(){
        hull(){
            translate([0,-al/2,0])
            cylinder(h=anchB, d=diametro, $fn=50, center=true);
            cylinder(h=anchB, d=diametro-2, $fn=50, center=true);
        }
        cylinder(h=anchB+1, d=4, $fn=50, center=true);
    }
    translate([pos-2.5-4,4,al/2-1])
    rotate([90,0,0])
    cube([3,al/2,anchB]);
}