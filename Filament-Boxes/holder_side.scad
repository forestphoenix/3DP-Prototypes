$fa = 1;
$fs = 0.6;

pipe_diameter = 36.0;
cube_side = pipe_diameter * 1.3;
cube_depth = 10.0;

module ScrewTube(size, length){
    cylinder(d=size * 2.5, h=length);
}

module ScrewCutout(size, length)
{
    chamferStart = length - size / 2;
    boreSize = size * 1.1;
    
    cylinder(d=boreSize, h=length);
    translate([0,0, chamferStart]) cylinder(h=length - chamferStart, d1=boreSize, d2=boreSize * 1.78);
}

difference()
{
    union()
    {
        cube([cube_side * 0.6, cube_side, cube_depth]);
        
        translate([cube_side * 0.3, 0.0, 0.0])
            cylinder(d=cube_side * 0.6, h=cube_depth);
        
        translate([cube_side * 0.3, cube_side, 0.0])
            cylinder(d=cube_side * 0.6, h=cube_depth);
    }
    
    translate([cube_side * 0.5,cube_side / 2,0])
                cylinder(d=pipe_diameter, h=cube_depth);
    
    translate([cube_side * 0.3, 0.0, 0.0])
        ScrewCutout(4, cube_depth);
    
    translate([cube_side * 0.3, cube_side, 0.0])
        ScrewCutout(4, cube_depth);
}