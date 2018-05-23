class Cell{
   int x;
   int y;
   int w;
   int h;
   boolean visited;
   boolean active;
   //0 = LEFT, 1 = RIGHT, 2 = UP, 3=DOWN
   boolean[] removedSides;
   
   public Cell(int x_, int y_, int w_, int h_){
     this.x = x_;
     this.y = y_;
     this.w = w_;
     this.h = h_;
     this.visited = false;
     this.active = false;
     this.removedSides = new boolean[4];
     for(int i=0;i<4;i++)this.removedsides[i]=false;Ma
   }
   
   public void show(){
     if(this.active){
       fill(255,0,0);
     }else if(this.visited){
       fill(0,255,0);
     }else{
       noFill();
     }
     stroke(0);
     rect(this.x*this.w,this.y*this.h,this.w, this.h);
   }
   
   
}
