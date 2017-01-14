class Star {
  //3D effect variables
 float x;
 float y;
 float z;
 
 float prevz; //Previous z
 
 float speed;
 
 //Mandatory parameter:: speed
 Star(float s) {
  x = random(-width / 2, width / 2);
  y = random(-height / 2, height / 2);
  z = random(0, width / 2);
  
  prevz = z;
  speed = s;
 }
 
 void update() {
   z = z - speed;
   
   //Resets star randomly when star moves out of canvas
   if (z < 1) {
    x = random(-width / 2, width / 2);
    y = random(-height / 2, height / 2);
    z = width / 2;
    prevz = z;
   }
   //Note that there is a large buffer where a star can go far out of the canvas before being reset
   //Code below is to relocate star back into the canvas RIGHT when it moves out of it
   /*
   if (z < max(abs(x), abs(y))) to replace if (z < 1)
   */
 }
 
 void show() {
   
   fill(255); // Use white for the stars
   noStroke(); // Disables outline
   
   // Using mapped coordinates, the stars will move faster
   float mx = map(x / z, 0, 1, 0, width / 2);
   float my = map(y / z, 0, 1, 0, height / 2);
   // Using map again, r (used in the size of the ellipse) will increase as z decreases
   float mr = map(z, 0, width / 2, 8, 0);
   
   ellipse(mx, my, mr, mr); // Drawing star with mapped coordinates
   
   //Adding streak vfx
   
   //Add if (prevz == z) if added immediate relocation of star outside canvas to prevent strange lines

   //Finding previous value for x and y coordinate
   float prevx = map(x / prevz, 0, 1, 0, width / 2);
   float prevy = map(y / prevz, 0, 1, 0 , height / 2);
   prevz = z; // Update z
   
   stroke(255); //Set color to white
   line(prevx, prevy, mx, my); // Drawing line to previous location to present location of the star/ellipse
   
 }
 
}
