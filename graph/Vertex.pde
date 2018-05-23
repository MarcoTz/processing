class Vertex{
   public int x;
   public int y;
   public int radius;
   public boolean selected;
   
   public Vertex(int x_, int y_, int radius_){
      this.x = x_;
      this.y = y_;
      this.radius = radius_;
      this.selected = false;
   }
   
   public boolean inside(int x_, int y_){
      return (this.x+radius>=x_ && this.x-radius<=x_
      && this.y+radius>=y_ && this.y-radius<=y_);
   }
}
