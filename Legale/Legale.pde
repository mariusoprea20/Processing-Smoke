Bricheta gg= new Bricheta();
Flacara fr= new Flacara();
Tigara tg= new Tigara();
SmokeFag ps=new SmokeFag(0, new PVector(220, 40));

void setup(){
  size(400,400);
  frameRate(100);
}

void draw(){
  background(0);
  fr.draw();
  gg.draw();
  gg.mousePressed(); 
  tg.draw();
  
}
//----------------------------------------------------------------------------------------------------------------------

class Bricheta{
  String s="JAVA";
  int x=267;
  int y=160;
  int w=40;
  int h=40;
  void draw(){
  strokeWeight(5);
  stroke(255);
  fill(55,85,55);
  rect(x,y,w,h);
  fill(111,111,111);
  rect(230,100,36,80);
  fill(111,104,111);
  rect(230,180,80,100);
  
  }
  void mousePressed(){
   if( mousePressed==true && (mouseX>=x && mouseX<=x+ w )&& (mouseY>=y && mouseY<=y+h)){
      y=165;
     fr.colors(255,0,0);
     fr.x=(int)random(228,233);
     tg.tColor(255,0,0);
     //JAVA TEXT
     fill(255,0,180);
     textSize(20);
     text(s,247,250);
     ps.run();
     int i=0;
     while(i<6){
     ps.addParticle();
     i++;
  }  
     
}
else {
     y=160;;
     fr.colors(0,0,0);     
    }
  }
}
//-------------------------------------------------------------------------------------------------------------------
class Flacara{
  float r;
  float g;
  float b;
  public int x=230;
  final int y=60;
  final int w=37;
  final int h=50;
  
  void colors(float r, float g, float b){
   this.r=r;
   this.g=g;
   this.b=b;
  }
  
  void draw(){
    noStroke();
    fill(r,g,b);
    ellipseMode(CORNER);

    ellipse(x,y,w,h);
}
}
//----------------------------------------------------------------------------------------------------------------------
class Tigara{
  float r=179;
  float g=213;
  float b=34;
 public void tColor(  float a, float b, float c){
   r=a;
   g=b;
   b=c;
 }
  void draw(){
   noStroke();
  fill(140,104,74);
  ellipse(40,40 , 200,20);//tigare
  fill(r,g,b);
  ellipse(220,40,19,19);
  }
}

//--------------------------------------------------------------------------------------------------------------

class SmokeFag {

  ArrayList<Smoke> smoke;    
  PVector origin;                   

  SmokeFag(int num, PVector v) {
    smoke = new ArrayList<Smoke>();              
    origin = v.copy();                                   
    for (int i = 0; i < num; i++) {
      smoke.add(new Smoke(origin));        
    }
  }
  void run() {
    for (int i = smoke.size()-1; i >= 0; i--) {
      Smoke p = smoke.get(i);
      p.run();
    }
  }
  void addParticle() {
    smoke.add(new Smoke(origin));
  }
}

//------------------------------------------------------------------------------------------------------------
class Smoke {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;

  Smoke(PVector l) {
    acc = new PVector(0, 0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 - 1.0;
    vel = new PVector(vx, vy);
    loc = l.copy();
    lifespan = 100.0;
  }

  void run() {
    update();
    draw();
  }
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0); 
  }
  void draw() {
     fill(255,lifespan);
    noStroke();
     ellipse(loc.x,loc.y,20,20);
  }
}
