Perceptron brain;

Point[] points = new Point[100];
int trainingIndex = 0;

void setup(){
  size(800,800);
  float[] inputs = {-1, 0.5};
  brain = new Perceptron(3);
  
  for (int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
}

void draw(){
  background(255);
  stroke(0);
  //line(0, height, width, 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  
  Point p1_ = new Point(-1, brain.guessY(-1));
  Point p2_ = new Point(1, brain.guessY(1));
  line(p1_.pixelX(), p1_.pixelY(), p2_.pixelX(), p2_.pixelY());
  for (Point pt : points)
    pt.show();
    
   for (Point pt : points){
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if (guess == target) fill(0,255,0);
      else fill(255,0,0);
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 16, 16);
  }
  
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if (trainingIndex == points.length)
  trainingIndex = 0;
}
  
  void mousePressed(){
  }