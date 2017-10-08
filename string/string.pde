// from the book Nature of Code by Daniel Shiffman

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
int len=10;
int numParticles=20;
ArrayList<Particle> particles=new ArrayList<Particle>();
Particle tail;

void setup() {
  size(640, 360);
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  physics.setWorldBounds(new Rect(0, 0, width, height));

  for (int i=0; i<numParticles; i++) {
    Particle particle=new Particle(i*len, 10);
    physics.addParticle(particle);
    particles.add(particle);
    if (i!=0) {
      Particle previous=particles.get(i-1);
      VerletSpring2D spring=new VerletSpring2D(particle, previous, len, 0.2);
      physics.addSpring(spring);
    }
  }
  
  particles.get(0).lock();
  particles.get(0).x=width/2;
  particles.get(0).y=0;
  tail=particles.get(numParticles-1);
  tail.r=16;
}

void draw() {
  physics.update();
  background(255);
  
  if (mousePressed) {
    tail.lock();
    tail.x=mouseX;
    tail.y=mouseY;
    tail.unlock();
  }

  stroke(0);
  noFill();
  beginShape();
  for (Particle p : particles) {
    vertex(p.x, p.y);
    //p.display();
  }
  endShape(OPEN);

  tail.display();
}