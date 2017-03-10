// Dice box for 81d6 (9 x 9 die grid)
//
// Measurements are in millimeters

dice_size = 12.05;  // mm / Dice width + some tolerance
wall_thickness = 2;  // mm / This should be adjusted per printer?
felt_thickness = 2;  // mm / Bottom of the box will have felt

inner_width = 9 * dice_size;
outer_width = inner_width + 2 * wall_thickness;

inner_heigth = dice_size + felt_thickness;
outer_heigth = inner_width + 2 * wall_thickness;

lid_width = inner_width + wall_thickness;

// The base box
translate([0, 0, dice_size/2]) {
    difference() {
        // Base and sides
        cube([outer_width, outer_width, dice_size], center=true);
        
        // Cut out insides
        translate([0, 0, wall_thickness]) {
            cube([inner_width, inner_width, dice_size], center=true);
        }
        
        // Cut out hole for lid
        translate([wall_thickness, 0, dice_size/2 - wall_thickness]) {
            cut_out_depth = wall_thickness/2;
            cut_size = inner_width + 2 * cut_out_depth;
            cube([cut_size+2*wall_thickness, cut_size, wall_thickness/2], center=true);
        }

    }
 
}

