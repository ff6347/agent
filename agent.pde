Agent agent;
PImage poo;
void setup() {
  poo = loadImage("poop.png");
  size(250, 250);
  smooth();
  background(255);
  imageMode(CENTER);
  agent = new Agent(new PVector(width/2, height/2));
}
void draw() {

  noStroke();
  fill(255);
  rect(0, 0, width, height);
  fill(0);
  if(mousePressed){
  text("On click poop!", 10, 15);
  }else{
  text("On click…", 10, 15);
  
  }
  
  agent.draw();
  agent.update();
  saveFrame("sec-#####.png");
}


class Agent {
  PVector pos;
  PVector speed;

  PImage img;
  float step = 2;
  ArrayList<PVector> poop;
  float xoff =0.0;
  float yoff =0.0;

  Agent(PVector _pos) {
    this.pos = _pos;
    this.speed = new PVector(_pos.x, _pos.y);
    poop = new ArrayList<PVector>();
    img = loadImage("agent.png");
  }
  void update() {
    xoff+=0.1;
    yoff+=0.4;

    float x = this.pos.x +(noise(xoff) * step) - step/2 ;//this.pos.x + random(-step, step);
    float y = this.pos.y +(noise(yoff) * step) - step/2;
    if (y <= 5) {
      y = 5;
    } else if (y >= height-5) {
      y = height-5;
    }
    if (x <= 5) {
      x = 5;
    } else if (x >= width-5) {
      x = width-5;
    }
    if (mousePressed) { 
      this.poop.add(new PVector(x, y));
    }
    //this.speed = new PVector(x,y).sub(pos);
    //this.pos.add(this.speed);
    this.pos.x  = x;
    this.pos.y  = y;
  }
  void draw() {
    strokeWeight(1);
    stroke(0);
    //translate(this.pos.x, this.pos.y);
    //rotate(speed.heading());
    for (PVector p : this.poop) {
      //point(p.x, p.y);
      image(poo, p.x, p.y, 20, 20);
    }
    image(img, this.pos.x, this.pos.y, 40, 40);
  }
}
