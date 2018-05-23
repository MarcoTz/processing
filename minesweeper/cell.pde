class Cell{
   int x;
   int y;
   boolean uncovered;
   boolean bomb;
   int neighborBombs;
   boolean flagged;
   
   public Cell(int x_,int y_){
     this.x = x_;
     this.y = y_;
     this.bomb = false;
     this.uncovered = false;
     this.neighborBombs = 0;
     this.flagged = false;
   }
}
