$fa = 1;
$fs = 0.6;

thickness = 1.5;
clip_diameter = 11;
clip_length = 30;
holder_diameter = 15;
holder_big_diameter = 25;
holder_height = 70;
number_of_baskets = 4;

module Clip(diameter, thickness, length, width)
{
    union()
    {
        translate([0, diameter, -length])
            cube([width, thickness, length]);

        difference()
        {
            translate([0, diameter / 2, 0]) rotate([0, 90, 0])
                cylinder(d = diameter + thickness * 2, h = width);
            
            translate([0, diameter / 2, 0]) rotate([0, 90, 0])
                cylinder(d = diameter, h = width);
            
            translate([0, 0, -diameter])
            cube([width, diameter, diameter]);
        }
    }
}

module Holder(diameter, height)
{
    radius = diameter / 2;
    
    difference()
    {
        union()
        {
            translate([0, -radius - thickness, -height])
                cube([diameter + thickness * 2, radius + thickness, height]);

            translate([radius + thickness, -radius - thickness, -height])
                cylinder(d=diameter + thickness * 2, h=height);
        }
        
        translate([radius + thickness, -radius - thickness, -height + thickness])
                cylinder(d=diameter, h=height - thickness);
        
        scale([1, 1, 0.5]) translate([0, -diameter - thickness, 0]) rotate([0, 90, 0])
            cylinder(d = diameter * 2, h = diameter + thickness * 2);
    }
}

module FullHolder(thickness, holder_diameter, height, clip_diameter, clip_length)
{
    union()
    {
        Clip(clip_diameter, thickness, clip_length, holder_diameter + thickness * 2);
        Holder(holder_diameter, height);
    }
}

for(i = [0:number_of_baskets - 1])
{
    offset = holder_big_diameter + thickness;
    translate([i * offset, 0, 0])
        FullHolder(thickness, holder_big_diameter, holder_height, clip_diameter, clip_length);
}
