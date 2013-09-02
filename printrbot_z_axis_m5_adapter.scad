da6 = 1 / cos(180 / 6) / 2;
da8 = 1 / cos(180 / 8) / 2;

rod_hole_diam = 6.5;
nut_diam = 8.25;
socket_depth = 5;
thickness = 2;

carriage_width = 24;
carriage_inside = 11.5;
carriage_slot_width = 4.2;

module adapter_body() {
  cube([carriage_width,carriage_slot_width,socket_depth+thickness],center=true);
  cube([carriage_inside,carriage_inside,socket_depth+thickness],center=true);
}

module adapter_holes() {
  // nut hole
  translate([0,0,thickness/2+0.025]) rotate([0,0,90])
    cylinder(r=nut_diam*da6,h=socket_depth+0.05,$fn=6,center=true);

  translate([0,0,-socket_depth/2-thickness/2+0.05])
    cylinder(r=rod_hole_diam*da6,h=thickness*2,$fn=6,center=true);
}

module adapter() {
  difference() {
    adapter_body();
    adapter_holes();
  }
}

adapter();
