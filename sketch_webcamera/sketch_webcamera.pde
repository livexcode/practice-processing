import processing.video.*;
Capture cam;
int imageIndex = 0;
void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  for (int i=0; i<cameras.length; i++) {
    println("[" + i + "] " + cameras[i]);
  }
  cam = new Capture(this, cameras[6]);
  cam.start();
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }

  image(cam, 0, 0);
  filter(GRAY);
  if (mousePressed) {
    String imageName = "images/webcam" + imageIndex++ + ".jpg";
    save(imageName);
    //sample
  }
}
