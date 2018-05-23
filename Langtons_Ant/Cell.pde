class Cell{
  int x;
  int y;
  int w;
  int h;
  color c;
  
  public Cell(int x_, int y_, int w_, int h_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
    c = color(255);
  }
  
  public void show(){
    stroke(0);
    fill(this.c);
    rect(this.x*this.w,this.y*this.h,this.w,this.h);
  }
}
