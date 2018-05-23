class snek{
  ArrayList<snekblock> blocks;
  int dir;
  int size;
  boolean eating;
  
  public snek(int size_){
     this.size = size_;
     this.blocks = new ArrayList<snekblock>();
     this.blocks.add(new snekblock(0,0, this.size));
     this.dir = UP;
     this.eating =false;
  }
  
  public void show(){
    for(int i=0;i<blocks.size();i++){
       blocks.get(i).show(); 
    }
  }
  
  public void update(){
    snekblock front = this.blocks.get(this.blocks.size()-1);
    snekblock newB = null;
   if(this.dir == UP){
     newB = new snekblock(front.x,front.y-front.size,front.size);
   }else if(this.dir == DOWN){
     newB = new snekblock(front.x,front.y+front.size,front.size);
   }else if(this.dir == LEFT){
     newB = new snekblock(front.x-front.size,front.y,front.size);
   }else if(this.dir == RIGHT){
     newB = new snekblock(front.x+front.size,front.y,front.size);
   }
   if(newB == null) return;
   if(newB.x>width*0.5) newB.x = (int)(-width*0.5);
   if(newB.x<-width*0.5) newB.x = (int)(width*0.5);
   if(newB.y>height*0.5) newB.y = (int)(-height*0.5);
   if(newB.y<-height*0.5)newB.y = (int)Math.floor(height*0.5);
    this.blocks.add(newB);
   if(this.eating){
     this.eating = false;
   }else this.blocks.remove(0);
  }
  
  public boolean intersects(){
     snekblock front = this.blocks.get(this.blocks.size()-1);
     for(int i=0;i<this.blocks.size()-2;i++){
       snekblock curr = this.blocks.get(i);
        if(front.x == curr.x && front.y == curr.y){
         return true; 
        }
     }
     
     return false;
  }
}
