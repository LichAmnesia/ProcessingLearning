// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Mover object
Bob[] bobs = new Bob[20];

Spring[] springs = new Spring[19];

void setup() {
  size(1080, 968);
  // Create objects at starting position
  // Note third argument in Spring constructor is "rest length"
  for (int i = 0; i < bobs.length; i++) {
    bobs[i] = new Bob(width/2, i*10);
  }
  for (int i = 0; i < springs.length; i++) {
    springs[i] = new Spring(bobs[i], bobs[i+1],40);
  }
}

void draw() {
  background(255); 

  for (Spring s : springs) {
    s.update();
    s.display();
  }

  for (Bob b : bobs) {
    b.update();
    b.drag(mouseX, mouseY);
    b.display();
  }
}



void mousePressed() {
  for (Bob b : bobs) {
    b.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (Bob b : bobs) {
    b.stopDragging();
  }
}