class Bird {
  float x, y; // Fuglens position
  float dy, ddy; // Fuglens hastighed og acceleration
  float w; // Fuglens størrelse
  float h;
  boolean ready2flap;
  int score;

  // Constructor til nye fugle
  Bird() {
    x = 150;
    y = height/2;
    dy = 0;
    ddy = 0.3;
    w =34;
    h = 24;
    ready2flap = true;
    textSize(50);
    score = 0;
  }

  // Afbild fuglen ved dens nuværende position
  void render() {
    imageMode(CENTER);

//Animation af fuglen
    if (hop == false) {
      image(redbird_mid, x, y);
    } else { 
      if (dy >= 10 || dy == 0 ) {
        image(redbird_mid, x, y);
      } else { 
        if (frameCount % 28 < 7) {
          image(redbird_down, x, y);
        } else {
          if (frameCount % 28 > 13 && frameCount % 28 < 21) {
            image(redbird_up, x, y);
          } else {
            image(redbird_mid, x, y);
          }
        }
      }
    }


    fill(255);
    if (hop == true) {
      text(score, width/2, 50);
    } else {
      image(loadImage("GM.png"), width/2, 275, 300, 75);
      textAlign(CENTER);
      text(b.score, width/2, height/2);
      text("Press space to restart", width/2, 475);
    }

  }

  // Opdater fuglens position
  void update() {
    dy += ddy;
    y += dy;

    if (y >= height-h/2-112/2) {
      y = height - h/2-112/2;
      dy = 0;
      p.dx = 0;
      p2.dx = 0;
      hop = false;
    }
    if (dist(x, 0, p.x+p.w/2, 0) <= 1 || dist(x, 0, p2.x+p2.w/2, 0)<=1) {
      score += 1;
    }
  }

  // Bask med vingerne
  void flap() {
    if (ready2flap) {
      dy += -8;
      ready2flap = false;
    }
  }
}
