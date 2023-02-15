int numAnimals1 = 3000;
float resource = 10000;
creature1[] creature = new creature1[numAnimals1];

void setup() {
  size(1000, 800);
  //frameRate(7);
  for (int i = 0; i < numAnimals1; i++) {
    creature[i] = new creature1(random(width), random(height));
  }
}

class world {
}

class creature1 {
  float speedY;
  int ability = 50;
  PVector position;
  PVector velocity;
  float orientation;

  creature1(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D().mult(random(2, 5));
    orientation = random(TWO_PI);
  }

  void render() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(orientation);
    fill(255);
    triangle(0, -15, -10, 15, 10, 15);
    popMatrix();
  }

  void update() {
    position.add(velocity);
    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }
    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}

void draw() {
  background(255);
  if (resource > 0) {
    for (int i = 0; i < numAnimals1; i++) {
      creature[i].update();
      creature[i].render();
    }
    resource = resource - 50;
    if (resource < 200 && resource > 0)
    {
      numAnimals1 = numAnimals1 - 10;
      resource = resource + 51;
      if(numAnimals1 == 0)
      numAnimals1 = 2000;
    }
    
    if (numAnimals1 == 0)
      {
        numAnimals1 = (numAnimals1 + 11);
      }
  }
    
 
  println("resource: ", resource);
  println("Animals: ", numAnimals1);
}
