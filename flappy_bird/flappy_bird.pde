Bird b;
Pipe p;
Pipe p2;
PImage base, redbird, bg, under_pipe, up_pipe;
boolean gameStart;

void setup() {
  size(600, 800);
  under_pipe = loadImage("pipe-green.png");
  under_pipe.resize(90,400);
  up_pipe = loadImage("up-pipe.png");
  up_pipe.resize(90,400);
  bg = loadImage("background-night.png");
  bg.resize(width, height);
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
 
  p.render();
  p2.render();
  p.update();
  p2.update();
  b.render();
  b.update();
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
