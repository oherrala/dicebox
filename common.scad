// Dice Box and Lid for 81d6 (9 x 9 die grid)
//
// Measurements are in millimeters.


// Dices per side. Box can then hold <dices> * <dices> of dices.
dices = 9;

// Length of one side of die in millimeters. Used to calculate the box dimensions.
dice_size = 12;

// 3D printer's nozzle diameter in millimeters. Used to calculate wall thickness.
nozzle_diameter = 0.4;

// How much extra space so the dices are not packed too hard.
// For example 12mm die * <extra_space> = 12 * 1.05 = 12.6 mm.
extra_space = 1.05;     

// Wall thickness in millimeters.
wall_thickness = 4 * nozzle_diameter;

// Bottom of the box will have felt. Thickness in millimeters.
felt_thickness = 2;

///
/// Blob of math
///
inner_width = dices * dice_size * extra_space;
outer_width = inner_width + 2 * wall_thickness;

inner_height = (dice_size + felt_thickness) * extra_space;
outer_height = inner_height + 4 * wall_thickness;

lid_width = inner_width + wall_thickness;

echo("Box outer width ", outer_width, " mm.");
echo("Box outer height ", outer_height, " mm.");

///
/// The Box itself
///
module box() {
    translate([0, 0, outer_height/2]) {
        difference() {
            // Base and sides
            cube([outer_width, outer_width, outer_height], center=true);
            
            // Cut out insides
            translate([0, 0, wall_thickness]) {
                cube([inner_width, inner_width, outer_height], center=true);
            }
            
            // Cut out hole and grooves for lid
            lid_groove_height = (inner_height * extra_space)/2;
            translate([0, -wall_thickness, lid_groove_height]) {
                cube([lid_width, lid_width+2*wall_thickness, wall_thickness], center=true);
            }
        } 
    }
}


///
/// The Dragon Lid
///
module lid() {
    difference() {
        cube([lid_width, lid_width, wall_thickness], center=true);

        translate([0, 0, wall_thickness/2]) {
            scale([0.5, 0.5, 0.5]) {
                linear_extrude(wall_thickness, center = true, $fs=0.01) {
                    import("Shadowrun-logo.svg", convexity=30, $fs=0.01);
                }
            }
        }
    }
}
