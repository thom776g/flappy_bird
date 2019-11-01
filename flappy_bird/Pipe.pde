class Pipe {
  float x; // Rørets position
  float dx; // Rørets hastighed
  float w; // Rørets bredde
  float y; // Hullets øvre position
  float h; // Hullets størrelse
  float min; //Min for hullets øvre position
  float max; //Min for hullets nedre position


  // Constructor til nye pipes
  Pipe(int tempX) {
    x = tempX;
    dx = -3;
    min = 200;
    max = 450;
    w = 90;
    y = random(min, max);
    h = 150;
  }

  // Afbild røret på canvasset
  void render() {
    fill(255);
    image(up_pipe, x, y-600);
    imageMode(CORNER);
    fill(255, 255, 255, 0);
    image(under_pipe, x, y+h);
  }

  // Opdater rørets position
  void update() {
    if (gameStart == true) {
      x += dx;
    }
    if (outOfCanvas() == true) {
      x = width;
      y = random(min, max);
    }
  }

  // Metode, der tjekker om røret er
  // blevet ramt af en fugl. Input skal være
  // et fugle-objekt og metoden skal returnere
  // true eller false alt efter om fuglen er 
  // ramt eller ej.
  boolean hit(Bird b) {
    return false;
  }

  // Metode, der returnerer true, når røret er uden
  // for canvas. Ellers false
  boolean outOfCanvas() {
    if (x+w < 0) {
      return true;
    } else {
      return false;
    }
  }
}
