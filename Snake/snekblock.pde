class snekblock{
  int x;
  int y;
  int size;
  color c;
  
  public snekblock(int x_, int y_, int size_){
     this.x = x_;
     this.y = y_;
     this.size = size_;
     this.c = color(255);
  }
  
  public void show(){
   noStroke();
   fill(this.c);
   rect(this.x,this.y,this.size,this.size);
  }
  
  public boolean intersects(snekblock other){
    if(this.x+this.size < other.x 
      || this.y+this.size < other.y 
      || other.x+other.size < this.x 
      || other.y+other.size < this.y){
      return false;
    }
     return true; 
  }
}
