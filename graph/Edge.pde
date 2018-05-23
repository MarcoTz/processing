class Edge{
   public Vertex v1;
   public Vertex v2;
   public boolean selected; 
   
   public Edge(Vertex v1_, Vertex  v2_){
      this.v1 = v1_;
      this.v2 = v2_;
      this.selected = false;
   }
   
   public boolean inside(int x_, int y_){
    float t1 = ((float)(x_-this.v2.x))/((float)(this.v1.x-this.v2.y));
    float t2 = ((float)(y_-this.v2.y))/((float)(this.v1.y-this.v2.y));;
    if( t1>0 && t1<1 && t2>0 && t2<1){
      return true;
    }else{
      return false; 
    }
   }
}
