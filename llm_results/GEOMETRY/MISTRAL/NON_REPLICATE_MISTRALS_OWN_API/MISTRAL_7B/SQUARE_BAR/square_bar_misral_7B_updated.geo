L = 10; // Length of the cuboid in cm.

// Define points
Point(1) = {0, 0, 0, L};
Point(2) = {0, 0, L, L};
Point(3) = {0, L, L, L};
Point(4) = {0, L, 0, L};
Point(5) = {L, 0, 0, L};
Point(6) = {L, 0, L, L};
Point(7) = {L, L, L, L};
Point(8) = {L, L, 0, L};

// Define lines
Line(1) = {Point1, Point2};
Line(2) = {Point2, Point3};
Line(3) = {Point3, Point4};
Line(4) = {Point4, Point1};
Line(5) = {Point5, Point6};
Line(6) = {Point6, Point7};
Line(7) = {Point7, Point8};
Line(8) = {Point8, Point5};

// Define surfaces
// Create a line loop for each face
Line Loop(Loop1) = {Line1, Line2, Line3, Line4}; // Front face
Line Loop(Loop2) = {Line4, Line8, Line7, Line1}; // Back face
Line Loop(Loop3) = {Line5, Line6, Line7, Line5}; // Top face
Line Loop(Loop4) = {Line1, Line5, Line6, Line2}; // Bottom face
Line Loop(Loop5) = {Line2, Line6, Line3, Line8}; // Right face
Line Loop(Loop6) = {Line3, Line8, Line4, Line5}; // Left face

// Define the surfaces
Plane Surface(Surface1) = {Loop1};
Plane Surface(Surface2) = {Loop2};
Plane Surface(Surface3) = {Loop3};
Plane Surface(Surface4) = {Loop4};
Plane Surface(Surface5) = {Loop5};
Plane Surface(Surface6) = {Loop6};

// Define the volume
Volume(Volume1) = {Surface1, Surface2, Surface3, Surface4, Surface5, Surface6};

// Define physical groups for boundaries
Physical Surface("Front") = {Surface1};
Physical Surface("Back") = {Surface2};
Physical Surface("Top") = {Surface3};
Physical Surface("Bottom") = {Surface4};
Physical Surface("Right") = {Surface5};
Physical Surface("Left") = {Surface6};
Physical Volume("Cuboid") = {Volume1};