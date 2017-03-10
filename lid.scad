// Dice box lid for 81d6 (9 x 9 die grid)
//
// Measurements are in millimeters

dice_size = 12.05;  // mm / Dice width + some tolerance
wall_thickness = 2;  // mm / This should be adjusted per printer?

inner_width = 9 * dice_size;
lid_width = inner_width + wall_thickness;

// surface(file = "Shadowrun-logo.svg", center = true, invert = true);

difference() {
    cube([lid_width, lid_width, wall_thickness], center=true);

    translate([0, 0, wall_thickness/2]) {
        scale([0.5, 0.5, 0.5]) {
            linear_extrude(wall_thickness, center = true) {
                import("Shadowrun-logo.svg", convexity=10);
            }
        }
    }
}