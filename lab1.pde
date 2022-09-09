int nbMovers =50;
boolean fluidon=false;
Mover[] movers;
Fluid fluid;
Mover balloon;

void setup () {
  size (800, 600);
  movers = new Mover[nbMovers];
  
  fluid = new Fluid();
balloon = new Mover(5, width/2, height/2);
  
  
  
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,7),400,0);
    movers[i].mass = random (1, 5);
    movers[i].location.x = 30 + i * (width / nbMovers);
    movers[i].location.y = movers[i].size.y;
  }
}

float xOff = 0.0;
float n;

void update() {
   PVector helium = new PVector (0, -0.01);
   
   PVector frictionballoon =balloon.velocity.get();
    
    frictionballoon.normalize();
    frictionballoon.mult(-1);
    frictionballoon.mult(0.02);
   
   balloon.applyForce(helium);
   
  for (int i = 0; i < movers.length; i++) {
  
   
    
    float m = movers[i].mass;
    
    PVector gravity = new PVector (0, 0.1 * m);
     
    PVector friction = movers[i].velocity.get();
    
    friction.normalize();
    friction.mult(-1);
    friction.mult(0.02);
    
   if (mousePressed && (mouseButton == LEFT)) {
      PVector wind = new PVector (-.1, 0);
      movers[i].applyForce(wind);
    }
    
      if (mousePressed && (mouseButton == RIGHT)) {
      PVector wind = new PVector (.1, 0);
      movers[i].applyForce(wind);
    }
    if (fluidon&&fluid.getRectangle().intersect(movers[i].getRectangle())) {   
      PVector fForce = fluid.draggingForce(movers[i].velocity, movers[i].mass);
      movers[i].applyForce(fForce);
      
      
    }
   
    
    movers[i].applyForce(gravity);
    movers[i].applyForce(friction);
    movers[i].update();
    movers[i].checkEdges();
  }  
}

void keyPressed() {
  if (key == 'r') {
    for (int i = 0; i < movers.length; i++) {
      movers[i].location.y = random (movers[i].size.y);
      
    }
    fluid =new Fluid();
  }
   if (keyCode==32 ){
    fluidon=!fluidon ;
   fill(255);
    }
  
}


void render () {
  background (255);
  
  balloon.display();

  if(fluidon){
    fluid.display();
    
  }
  
  fill(100, 200, 100);


  for (int i = 0; i < movers.length; i++) {
    movers[i].display();
  }
}



void draw () {
  update();
  render();
    
}
