// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the Dimensions
L_axle = 20; // Length of the axle in cm
R_axle = 1;  // Radius of the axle in cm
R_wheel = 5; // Radius of the wheels in cm
T_wheel = 2; // Thickness of the wheels in cm

// Define the Axle
// The axle is a cylinder centered at the origin and extending along the z-axis
Axle = Cylinder(1) = {0, 0, -L_axle/2, 0, 0, L_axle, R_axle};

// Define the Wheels
// The first wheel is at the negative end of the axle
Wheel1 = Cylinder(2) = {0, 0, -L_axle/2 - T_wheel, 0, 0, T_wheel, R_wheel};

// The second wheel is at the positive end of the axle
Wheel2 = Cylinder(3) = {0, 0, L_axle/2, 0, 0, T_wheel, R_wheel};

// Fuse the Axle and Wheels into a single volume
UnifiedVolume() = BooleanUnion{ Volume{Axle}; Delete; }{ Volume{Wheel1}; Delete; Volume{Wheel2}; Delete; };

// Define Physical Groups for Boundaries
Physical Volume("UnifiedWheelAndAxle") = {UnifiedVolume()};