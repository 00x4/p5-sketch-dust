float _x;
float _y;
float _directionX = random(-10, 10);
float _directionY = random(-10, 10);
color _dotColor;
boolean _isEllipse;
int _counter;

void setup() {
  size(800, 600);
  background(255);
  stroke(150);
  fill(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  _x = random(width);
  _y = random(height);
  _dotColor = color(random(230, 255), random(230, 255), random(230, 255));
  smooth();
}

void draw() {
  if (random(100) > 90) {
    _directionX = random(-10, 10);
    _directionY = random(-10, 10);
  }
  float moveX = _directionX + random(-10, 10);
  float moveY = _directionY + random(-10, 10);
  _x = pointLoop(_x + moveX, 0, width);
  _y = pointLoop(_y + moveY, 0, height);
  float size = max(abs(moveX), abs(moveY));
  _dotColor = changeColorLittleBit(_dotColor);
  fill(_dotColor);
  stroke(150);
  if (!mousePressed) {
    drawDot(_x, _y, size);
  } else {
    drawCloud(size);
  }
  if (_counter++ > 10) {
    drawSmoke();
    _counter = 0;
  }
  if (keyPressed && keyCode == SHIFT) {
    delay((int)random(200));
  }
}

float pointLoop(float value, float min, float max) {
  if (value < min) {
    value = max;
  } else if (value > max) {
    value = min;
  }
  return value;
}

color changeColorLittleBit(color c) {
  return color(
    min(max(red(c) + random(-3, 3), 230), 255),
    min(max(green(c) + random(-3, 3), 230), 255),
    min(max(blue(c) + random(-3, 3), 230), 255)
  );
}

void drawDot(float x, float y, float size) {
  if (_isEllipse) {
    ellipse(x, y, size, size);
  } else {
    rect(x, y, size, size);
  }
}

void drawCloud(float size) {
  for (int i = 0; i < 20; i++) {
    drawDot(random(width), random(height), size);
  }
}

void drawSmoke() {
  fill(color(255, 30));
  noStroke();
  rect(width / 2, height / 2, width, height);
}

void keyPressed() {
  if (keyCode == TAB) {
    _isEllipse = !_isEllipse;
  }
}
