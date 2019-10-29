Bird b;
Pipe p;
Pipe p2;
PImage base, redbird, bg, under_pipe, over_pipe;
boolean gameStart;
boolean hop = true;

void setup() {
  size(600, 800);
  under_pipe = loadImage("pipe-green.png");
  under_pipe.resize(90, 400);
  bg = loadImage("background-night.png");
  bg.resize(width, height);
  base = loadImage("base.png");
  noStroke();
  gameStart = false;
  b = new Bird();
  p = new Pipe(width+100 );
  p2 = new Pipe(width+425);


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

  //Kollisoner
  // SIDERNE
  if ((b.x + b.s/2 > p.x && b.x - b.s/2 < p.x + p.w && (b.y+b.s/2 < p.y  || b.y-b.s/2 > p.y+p.w))  ) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  // TOP OG BUND
  if ((b.y-b.s/2 <= p.y||b.y+b.s/2 >= p.y+p.h ) &&  (b.x-b.s/2 < p.x+p.w  && b.x+b.s/2 > p.x)) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  // SIDERNE 2
  if ((b.x + b.s/2 > p2.x && b.x - b.s/2 < p2.x + p2.w && (b.y+b.s/2 < p2.y  || b.y-b.s/2 > p2.y+p2.w))) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  //  TOP OG BUND
  if ((b.y-b.s/2 <= p2.y||b.y+b.s/2 >= p2.y+p2.h ) &&  (b.x-b.s/2 < p2.x+p2.w && b.x+b.s/2 > p2.x)) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (hop == true) {
      b.dy=0;
      b.flap();
      gameStart = true;
    }
  }
}

void keyReleased() {
  if (!b.ready2flap) {
    b.ready2flap = true;
  }
}
