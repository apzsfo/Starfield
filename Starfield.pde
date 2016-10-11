Particle [] particles;
void setup()
{
size(500, 500);
particles = new Particle[300];
for(int i = 0; i < particles.length; i++){
  particles[i] = new NormalParticle();
}
for (int j = 0; j < 39; j++){
  particles[j] = new OddballParticle();
}
for (int k = 39; k <=40; k++){
  particles[k] = new JumboParticle();
}
}

void draw()
{
	background(0);
	for(int i=0; i<particles.length; i++){
	  particles[i].move();
	  particles[i].show();
	}
	fill(0, 0, 0,10);
	rect(0, 0, 0,500, 500);
}

class NormalParticle implements Particle
{
  double x, y, speed, angle;
  int myColor;
  NormalParticle() {
    x=30;
    y=30;
    speed= 5;
    angle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
}
public void move() {
  x += speed*Math.cos(angle);
  y += speed*Math.sin(angle);

}

public void show() {
  fill(myColor);
  noStroke();
  ellipse((int)x, (int)y, 7, 7);
}

}
interface Particle
{
  public void move();
  public void show();
}

class OddballParticle implements Particle //uses an interface
{
  double x, y, angle, speed;
  OddballParticle() {
      x=300;
      y=300;
      angle = Math.PI*2*Math.random();
      speed = Math.random()*2+2;
  }
  public void move(){
    x += speed*Math.cos(angle);
    y += speed*Math.sin(angle);
    angle += 0.03;
}
  public void show() {
       fill(255);
       noStroke();
       ellipse((int)x, (int)y, 10, 11);
  }
}
       
class JumboParticle extends NormalParticle //uses inheritance
{
  void show() {
    fill(myColor);
    noStroke();
    ellipse((int)x, (int)y, 90, 90);
  }
}
	

