import java.awt.Polygon;
 
CustomShape deviceTop = new CustomShape();
CustomShape deviceLeft = new CustomShape();
CustomShape deviceRight = new CustomShape();

void setup() {
  size(400, 400);
  /* define top of device */
  deviceTop.addPoint(200, 178);
  deviceTop.addPoint(37, 84);
  deviceTop.addPoint(83, 38);
  deviceTop.addPoint(139, 10);
  deviceTop.addPoint(200, 0);
  deviceTop.addPoint(261, 10);
  deviceTop.addPoint(317, 38);
  deviceTop.addPoint(363, 84);
  /* define bottom left of device */
  deviceLeft.addPoint(181, 211);
  deviceLeft.addPoint(181, 400);
  deviceLeft.addPoint(118, 383);
  deviceLeft.addPoint(66, 348);
  deviceLeft.addPoint(27, 300);
  deviceLeft.addPoint(5, 242);
  deviceLeft.addPoint(1, 180);
  deviceLeft.addPoint(18, 117);
  /* define bottom right of device */
  deviceRight.addPoint(219, 211);
  deviceRight.addPoint(382, 117);
  deviceRight.addPoint(399, 180);
  deviceRight.addPoint(396, 242);
  deviceRight.addPoint(373, 300);
  deviceRight.addPoint(335, 348);
  deviceRight.addPoint(282, 382);
  deviceRight.addPoint(219, 399);
  smooth();
}

/* code adapted from forum snippet, see readme */
void draw() {
  background(255);
  randomSeed(mouseX+mouseY);
  noStroke();
  fill(0);
  for (int i=0; i<100; i++) {
    float x = random(width);
    float y = random(height);
    if (deviceTop.contains(x, y)) {
      ellipse(x, y, 30, 30);
    }
    if (deviceLeft.contains(x, y)) {
      ellipse(x, y, 30, 30);
    }
    if (deviceRight.contains(x, y)) {
      ellipse(x, y, 30, 30);
    }
  }
}

/* define how to draw polygons */
class CustomShape extends Polygon {
 
  void display() {
    stroke(0);
    fill(255);
    beginShape();
    for (int i=0; i<npoints; i++) {
      vertex(xpoints[i], ypoints[i]);
    }
    endShape(CLOSE);
  }
}
