class Rocket {
  // attributter
  int diameter = 10; // diameter

  PVector pos;
  float angle = random(radians(-30), radians(30)); // Begræns vinklen til mellem -30 og 30 grader

  float xSpeed = random(0.05, 1); // Tilfældig vandret hastighed
  float ySpeed = random (-2.8, -1.5); // lodret hastighed som skal tilpasses skærmstørrelsen
  PVector velocity = new PVector(xSpeed, ySpeed);

  // farver til eksplosion RGB og opauqe værdi alfa
  int r=int(random(256));
  int g=int(random(256));
  int b=int(random(256));
  int alfa=255;

  //PVector velocity = new PVector(cos(angle), -2 + sin(angle));
  float minHeight = height-(height/4); // Minimumshøjde
  boolean exploded = false;

  // lyd
  boolean soundPayed = false;
  boolean lift= true; // bruges til bang lyd

  // konstruktør
  Rocket() {
    pos = new PVector(random(10, 80), height); // Startposition tilfældigt langs bunden
  }

  // metoder




  void playExplodingSound() {
    if (!soundPayed && !lift) {
      singleRocket.play();
      soundPayed = true;
    }
  }

  void display() {
    if (!exploded) {
      circle(pos.x, pos.y, diameter);
    } else {
      // Tegn eksplosion (du kan tilpasse dette)
      fill(255, 0, 0);
      ellipse(pos.x, pos.y, diameter * 2, diameter * 2);
    }
  }

  void move() {
    // for at variere højden
    float yspeed = random(0.0001, 0.01);
    float xspeed = random(0.00001, 0.0005); // Begræns den vandrette hastighed

    if (!exploded) {
      
      pos.add(velocity);
      velocity.y += yspeed;
      velocity.x += xspeed;
      checkExplosion();
    }
  }

  void checkExplosion() {
    // Tjek om raketten er på vej nedad og har nået minimumshøjden
    if ((velocity.y > 0 || pos.x > width - 20 || pos.x < 20) && pos.y < minHeight) {
      explode();
    }
  }

  void explode() {
    exploded = true;
    // Tilføj eventuelle yderligere eksplosionseffekter her
  }
}