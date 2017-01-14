/*
Sunny Xu
*/

int amt_star = 800; // Amount of stars
Star[] stars = new Star[amt_star]; // Initialize array of stars

float speed = 7; // Controls the speed at which the stars move


void setup() {
 size(900, 600);
 
 //Initialize a star for every element in the array
 for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(speed); 
 }
}

void draw() {
  background(0); //Set background to be black
  translate(width / 2, height / 2); //Set initial coordinates to be in the middle of the canvas instead of the top left
  
  //Update and draw all stars in array
  for (int i = 0; i < stars.length; i++) {
   stars[i].update();
   stars[i].show();
  }
  
}