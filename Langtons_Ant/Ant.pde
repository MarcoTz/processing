class Ant extends Cell{
  //0=UP, 1=RIGHT, 2=DOWN, 3=LEFT
  int dir;
  int maxX;
  int maxY;
  
  public Ant(int x_, int y_, int w_, int h_,int maxX_,int maxY_){
   super(x_,y_,w_,h_); 
   this.dir = UP;
   this.maxX = maxX_;
   this.maxY = maxY_;
   this.c = color(255,0,0);
  }
  
  public void move(){
    if(this.dir==0){
      this.y--; 
    }else if(this.dir==1){
      this.x++;
    }else if(this.dir==2){
     this.y++;
    }else if(this.dir==3){
     this.x--; 
    }
    
    if(this.x<0) this.x = this.maxX;
    if(this.x>this.maxX) this.x=0;
    if(this.y<0) this.y = this.maxY;
    if(this.y>this.maxY) this.y=0;
  }
}
