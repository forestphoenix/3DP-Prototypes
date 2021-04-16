$fa = 1;
$fs = 0.4;

outer_diameter = 40;

difference()
{
    union()
    {
    cylinder(h=3, d=outer_diameter);
    translate([0,0,3])
        cylinder(h=2, d1=outer_diameter, d2=outer_diameter - 4);
    }
    cylinder(h=3, d=4.7);
    translate([0,0,3])
        cylinder(h=2, d1=4.7, r2=5);
}
