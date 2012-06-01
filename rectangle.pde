float framerate = 0.2;
float golden_ratio = 1.618;

void setup() {
  size(750, 500);
  frameRate(framerate);
  noStroke();
}

int get_brightness(float i) {
  int min_brightness = 150;
  int max_brightness = 240;
  int num_shades = 10;
  int index = i + frameCount;
  int shade = (max_brightness - min_brightness) * sin(PI * index % num_shades / num_shades);
  return min_brightness + shade;
}

void draw() {
  background(#FFFFFF);

  boolean is_portrait = false;
  int height = 400;
  int width = height * golden_ratio;

  for (int i = 0; i < 10; i = i + 1) {
    int brightness = get_brightness(i); 
    fill(brightness, brightness, brightness);

    rect(50, 50, width, height);

    is_portrait = !is_portrait;
    if (is_portrait) {
      width = height * 1 / golden_ratio;
    } else {
      height = width * 1 / golden_ratio;
    }
  }
}