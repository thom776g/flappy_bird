class Bird {
  float x, y; // Fuglens position
  float dy, ddy; // Fuglens hastighed og acceleration
  float s; // Fuglens størrelse
  boolean ready2flap;
  int score;

  // Constructor til nye fugle
  Bird() {
    x = 150;
    y = height/2;
    dy = 0;
    ddy = 0.3;
    s = 50;
    ready2flap = true;
    textSize(50);
    score = 0;
  }

  // Afbild fuglen ved dens nuværende position
  void render() {
    imageMode(CENTER);


    if (frameCount % 28 < 7) {
      image(redbird_down, x, y);
    } else {
      if (frameCount % 28 > 13 && frameCount % 28 < 21) {
        image(redbird_up, x, y);
      } else {
        image(redbird_mid, x, y);
      }
    }

    fill(0);


    text(score, width/2, 50);
  }

  // Opdater fuglens position
  void update() {
    dy += ddy;
    y += dy;

    if (y >= height-s/2) {
      y = height - s/2;
      dy = 0;
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
