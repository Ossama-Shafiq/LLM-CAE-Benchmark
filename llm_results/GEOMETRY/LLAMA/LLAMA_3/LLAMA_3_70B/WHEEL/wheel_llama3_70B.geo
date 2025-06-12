// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define dimensions
wheel_radius = 5; // cm
wheel_height = 2; // cm
axle_radius = 1; // cm
axle_length = 20; // cm
wheel_center_distance = 24; // cm

// Define points
Point(1) = {0, 0, -wheel_height/2, 0.1}; // center of wheel 1
Point(2) = {0, 0, wheel_height/2, 0.1}; // top of wheel 1
Point(3) = {wheel_center_distance, 0, -wheel_height/2, 0.1}; // center of wheel 2
Point(4) = {wheel_center_distance, 0, wheel_height/2, 0.1}; // top of wheel 2
Point(5) = {0, 0, -axle_length/2, 0.1}; // center of axle
Point(6) = {wheel_center_distance, 0, -axle_length/2, 0.1}; // end of axle

// Define cylinders
Cylinder(1) = {0, 0, -wheel_height/2, 0, 0, wheel_height, wheel_radius}; // wheel 1
Cylinder(2) = {wheel_center_distance, 0, -wheel_height/2, 0, 0, wheel_height, wheel_radius}; // wheel 2
Cylinder(3) = {0, 0, -axle_length/2, wheel_center_distance, 0, axle_length, axle_radius}; // axle

// Define physical groups
Physical Volume("Wheel1") = {1};
Physical Volume("Wheel2") = {2};
Physical Volume("Axle") = {3};