// Defining Particle's class from toxicLibs VerletPArticle2D

class Particle extends VerletParticle2D {
  float r;
  Particle (Vec2D loc) {
    super(loc);
  }
  Particle (float x, float y) {
    super(x,y);
    r=2;
  }
  void display() {
    fill(175);
    stroke(0);
    ellipse(x,y,r,r);
  }
}