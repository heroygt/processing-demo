Sperm sperm1;
Sperm sperm2;

void setup() {
     size(800, 400, P3D);
     sperm1 = new Sperm(100);
     sperm2 = new Sperm(200);
     sperm3 = new Sperm(300);
}

   void draw() {
     background(204);
     line(0,150,width,150);
     line(0,250,width,250);
     sperm1.draw();
     sperm2.draw();
     sperm3.draw();
}

class Sperm {
  float i = 0;
  int _x=1;
  int _y=0;
  int startY=0;
  int _direction=1;
  int TAIL_LENGTH = 150;
  float speed = 1;
  float a = 0;
  float a2 = 0;
  
   Sperm(int y){
     startY = y;
   }
   
   void draw() {
     calcSpeed();
     if (i > width - 60) {
       i = width - 60;
       turnAround();
     }
     if (i < 0) {
       i = 0;
      turnAround();
     }
     pushMatrix();
     translate(width-30-i, startY);
     rotateY(radians(90*(_direction-1)));
     drawHead();
     drawTail();
     popMatrix();
  }
  
  void calcSpeed() {
    i+= speed * _direction;
    a2 = random(-1, 1);
    speed += a/2;
    var topSpeed = min(sin(PI*i/( width - 60)) * 15, 5);
    if (speed > topSpeed) speed = topSpeed;
    if (speed < 2) speed = 2;
    a = a2;
  }
  
  void turnAround() {
     speed = 0;
     a = 1;
     a2 = 2;
     _direction = -_direction;
  }
  
  void drawHead() {
    ellipse(_x, _y, 60, 35);
  }
  
  void drawTail() {
    float offsetX = 0;
    float offsetY = 0;
    while(offsetX < TAIL_LENGTH) {
      offsetX= offsetX + 0.8;
      offsetY = sin(radians(offsetX - (i+speed+a2)*8*_direction)) *9* (speed+a2) * offsetX/TAIL_LENGTH;
      point(_x+30 + offsetX, _y + offsetY);
    }
  }
}

