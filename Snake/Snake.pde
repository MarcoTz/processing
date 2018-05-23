snek s;
int blocksize = 10;
snekblock candy;

void setup(){
  size(500,500);
  s = new snek(blocksize);
  int candyx = (int)Math.floor(random(-width/2,width/2-blocksize));
  int candyy = (int)Math.floor(random(-height/2,height/2-blocksize));
  candy = new snekblock(candyx,candyy,blocksize);
  candy.c = color(255,0,0);
  frameRate(10);
}

void draw(){
  background(100);
  translate(width/2,height/2);
  s.show();
  candy.show();
  snekblock front = s.blocks.get(s.blocks.size()-1);
  if(front.intersects(candy)){
    s.eating = true;
    candy.x = (int)Math.floor(random(-width/2,width/2-blocksize));
    candy.y = (int)Math.floor(random(-height/2,height/2-blocksize));
  }
  
  if(s.intersects()){
   s = new snek(blocksize);
   candy.x = (int)Math.floor(random(-width/2,width/2-blocksize));
   candy.y = (int)Math.floor(random(-height/2,height/2-blocksize));
  }
  s.update();
}

void keyPressed(){
  if(key == 'w' && s.dir != DOWN){
    s.dir = UP;
  }else if(key == 'a' && s.dir != RIGHT){
    s.dir = LEFT;
  }else if(key == 's' && s.dir != UP){
    s.dir = DOWN;
  }else if(key == 'd' && s.dir != LEFT){
    s.dir=RIGHT;
  }
}
