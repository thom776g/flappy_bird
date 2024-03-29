Bird b;
Pipe p;
Pipe p2;
PImage base, redbird_down, redbird_mid, redbird_up, bg, bg2, under_pipe, up_pipe;
boolean gameStart;
boolean hop = true;
int x1, x2, x3, y;
int Day_or_night = int(random(0,3));

void setup() {
  size(600, 800);
  under_pipe = loadImage("pipe-green.png");

  under_pipe.resize(90, 600);
  up_pipe = loadImage("up-pipe.png");
  up_pipe.resize(90, 600);
  bg = loadImage("background-night.png");
  bg2 = loadImage("background-day.png");
  bg.resize(width, height);
  bg2.resize(width,height);
  base = loadImage("base.png");
  noStroke();
  gameStart = false;
  b = new Bird();
  p = new Pipe(width+100 );
  p2 = new Pipe(width+425);
  
  x1 = 0;
  x2 = x1 + 336;
  x3 = x2 + 336;

  redbird_mid = loadImage("redbird-midflap.png");
  redbird_down = loadImage("redbird-downflap.png");
  redbird_up = loadImage("redbird-upflap.png");
}

void draw() {
  imageMode(CORNER);
  if (Day_or_night == 1){
  image(bg, 0, 0, width, height);
  }
  else {
    image(bg2, 0, 0, width, height);
  }

  p.render();
  p2.render();
  p.update();
  p2.update();
  b.render();
  b.update();
  if (hop == false) {
    gameOver();
  }

 imageMode(CORNER);
  x1 = x1-3;
  x2 = x2-3;
  x3 = x3-3;

  image(base, x1, height-112/2);
  image(base, x2, height-112/2);
  image(base, x3, height-112/2);

  if (hop == true) {
    if (x1 <= - 336) {
      x1 = x3 + 336;
    } 
    if (x2 <= -336) {
      x2 = x1 + 336;
    } 
    if (x3 <= -336) {
      x3 = x2 + 336;
    }
  } else {
    x1 = 0;
    x2 = x1 + 336;
    x3 = x2 + 336;
  }

  //Kollisoner
  // SIDERNE
  if ((b.x + b.w/2 > p.x && b.x - b.w/2 < p.x + p.w && (b.y-b.h/2 < p.y  || b.y+b.h/2 > p.y+p.h))  ) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  // TOP OG BUND
  if ((b.y-b.h/2 <= p.y||b.y+b.h/2 > p.y+p.h ) &&  (b.x-b.w/2 < p.x+p.w  && b.x+b.w/2 > p.x)) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  // SIDERNE 2
  if ((b.x + b.w/2 > p2.x && b.x - b.w/2 < p2.x + p2.w && (b.y-b.h/2 < p2.y  || b.y+b.h/2 > p2.y+p2.h))) {
    p.dx = 0;
    p2.dx = 0;
    hop = false;
  }
  //  TOP OG BUND
  if ((b.y+b.h/2 > p2.y+p2.h ) &&  (b.x-b.w/2 < p2.x+p2.w && b.x+b.w/2 > p2.x)) {
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

void reset() {
  hop = true;
  b.ready2flap = true;
  gameStart = false;
  b.x = 150;
  b.y = height/2;
  b.score = 0;
  b.dy = 0;

  p.x = width+100;
  p2.x = width+425;
  p.y = random(200, 600);
  p2.y = random(200, 600);
  p.dx = -3;
  p2.dx = -3;
  Day_or_night = int(random(0,3));
}

void gameOver() {
  if (keyPressed == true) {
    if (key == ' ') {
      reset();
    }
  }
}
