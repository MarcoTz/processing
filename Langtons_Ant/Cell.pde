class Cell{
  int x;
  int y;
  int w;
  int h;
  
  public Cell(int x_, int y_, int w_, int h_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
  }
  
  public void show(){
    stroke(0);
    fill(255);
    rect(this.x*this.w,this.y*this.h,this.w,this.h);
  }
}
