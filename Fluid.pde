/**
  Classe simulant un fluide. Elle est représentée par un rectangle.
*/
class Fluid {
  Rectangle r;
  float _height=random(0.1*height,0.4*height);
  float density;
  float coefficientFriction;
  
  Fluid () {
    float quarterHeight = height / 4;
    r = new Rectangle(0,random(600),width,height);
    density = 0.8;
    coefficientFriction = 0.1;
  }
  
  Fluid (Rectangle _r, float _density, float _coefficientFriction) {
    r = _r;
    density = _density;
    coefficientFriction = _coefficientFriction;
  }
  
  void setRectangle (Rectangle _r) {
    r = _r;
  }
  
  Rectangle getRectangle () {
    return r;
  }
  
  void display () {
    r.display();
    

     fill(0);
  text("Gabriel Jordan-Riendeau",height/2+15, width/2+50);
  }
  
  /**
  Formule F = -0.5 * rho * ||v||^2 * area * friction * speed.normalise
  */
  PVector draggingForce(PVector speed, float area) {
    float speedMag = speed.mag();
    float coeffRhoMag = density * coefficientFriction * speedMag * speedMag * 0.5;
    
    PVector result = speed.get();
    result.mult(-1);
    result.normalize();
    result.mult(area);
    result.mult(coeffRhoMag);
   
    return result;
  }
}
