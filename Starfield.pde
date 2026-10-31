Particle[] particles = new Particle[1000]; 

void setup() { 
  size(400, 400); 
  noStroke(); 
  
  for (int i = 0; i < particles.length; i++) { 
    particles[i] = new Particle(); 
  } 
  
  particles[0] = new OddballParticle(); 
} 

void draw() { 
  background(30); 
  
  for (int i = 0; i < particles.length; i++) { 
    particles[i].move();
    particles[i].show(); 
  } 
} 

class Particle { 
  double myX, myY, mySpeed, myAngle; 
  int myColor; 
  
  Particle() { 
    myX = 200.0; 
    myY = 200.0; 
    myAngle = Math.random() * 7.0; 
    mySpeed = Math.random() * 5.0 + 1; 
    myColor = color((int)(Math.random() * 256.0), (int)(Math.random() * 256.0), (int)(Math.random() * 256.0)); 
  } 
  
  void move() { 
    myX += Math.cos(myAngle) * mySpeed; 
    myY += Math.sin(myAngle) * mySpeed; 
    if (myX < 0 || myX > 400 || myY < 0 || myY > 400) { 
      myX = 200.0; 
      myY = 200.0; 
      myAngle = Math.random() * 7.0; 
      mySpeed = Math.random() * 5.0; 
    } 
  } 
  
  void show() { 
    fill(myColor); 
    ellipse((float)myX, (float)myY, 4, 4); 
  } 
}

class OddballParticle extends Particle { 
  OddballParticle() { 
    myX = 200.0; 
    myY = 200.0; 
    myAngle = Math.random() * 7.0; 
    mySpeed = Math.random() * 2.0; 
  }
  
  void move() {
    myAngle += 0.05;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;

    if (myX < 0 || myX > 400 || myY < 0 || myY > 400) {
      myX = 200.0;
      myY = 200.0;
      mySpeed = Math.random() * 2.0 + 5;
    }
  }
  
  void show() {
    fill(255, 200, 0);
    rect((float)myX, (float)myY, 15, 15);
  }
}
