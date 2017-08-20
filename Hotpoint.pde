class Hotpoint {
  PVector center;
  color fillColor;
  color strokeColor;
  int boxWidth;
  int boxHeight;
  int boxDepth;
  int pointsIncluded;
  int maxPoints;
  boolean wasJustHit;
  int threshold;
  
  Hotpoint(float centerX, float centerY, float centerZ, int bWidth, int bHeight, int bDepth){
    center = new PVector(centerX, centerY, centerZ);
    boxWidth = bWidth;
    boxHeight = bHeight;
    boxDepth = bDepth;
    pointsIncluded = 0;
    maxPoints = 1000;
    threshold = 250;
    
    fillColor = strokeColor = color(random(255), random(255), random(255));
  }
  
  boolean check(PVector point){
    boolean result = false;
    
    if(point.x > center.x - boxWidth/2 && point.x < center.x + boxWidth/2){
      if(point.y > center.y - boxHeight/2 && point.y < center.y + boxHeight/2){
        if(point.z > center.z - boxDepth/2 && point.z < center.z + boxDepth/2){
          result = true;
          pointsIncluded++;
        }
      }
    }
    return result;
  }
  
  void draw(){
    pushMatrix();
      translate(center.x, center.y, center.z);
      fill(red(fillColor), blue(fillColor), green(fillColor), 255*percentIncluded());
      stroke(red(strokeColor),blue(strokeColor),green(strokeColor), 255);
      box(boxWidth,boxHeight,boxDepth);
    popMatrix();
  }
  
  float percentIncluded(){
    return map(pointsIncluded, 0, maxPoints, 0, 1);
  }
  
  boolean currentlyHit(){
    return (pointsIncluded > threshold);  
  }
  
  boolean isHit(){
    return currentlyHit() && !wasJustHit;
  }
  
  void clear(){
    wasJustHit = currentlyHit();
    pointsIncluded = 0;
  }
}
