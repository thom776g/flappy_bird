Bird b;
Pipe p;
Pipe p2;
PImage base, redbird_mid, redbird_up, redbird_down, bg, under_pipe, over_pipe;
boolean gameStart;

void setup() {
  size(600, 800);
  under_pipe = loadImage("pipe-green.png");
  under_pipe.resize(90,310);
  bg = loadImage("background-night.png");
  bg.resize(width, height);
  base = loadImage("base.png");
  noStroke();
  gameStart = false;
  b = new Bird();
  p = new Pipe(width+100, int(random(200, 600)));
  p2 = new Pipe(width+425, int(random(200, 600)));


  redbird_mid = loadImage("redbird-midflap.png");
  redbird_up = loadImage("redbird_upflap.png");
  redbird_down = loadImage("redbird_downflap.png");
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
