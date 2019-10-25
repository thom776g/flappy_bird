Bird b;
Pipe p;
Pipe p2;
PImage base, redbird, bg;
boolean gameStart;

void setup() {
  size(600, 800);
  bg = loadImage("background-night.png");
  base = loadImage("base.png");
  noStroke();
  gameStart = false;
  b = new Bird();
  p = new Pipe(width+100, int(random(200, 600)));
  p2 = new Pipe(width+425, int(random(200, 600)));


  redbird = loadImage("redbird-midflap.png");
}

void draw() {
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  image(base, 0, height-112/2, 336, 112);
  image(base, 336, height-112/2, 336, 112);
  b.render();
  b.update();
  p.render();
  p2.render();
  p.update();
  p2.update();
}

void keyPressed() {
  if (key == ' ') {
    b.dy=0;
    b.flap();
    gameStart = true;
  }
}

void keyReleased() {
  if (!b.ready2flap) {
    b.ready2flap = true;
  }
}
