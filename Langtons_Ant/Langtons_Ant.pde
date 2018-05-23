Cell[][] grid;
int gridw;
int gridh;

void setup(){
  size(500,500);
  gridw = 20;
  gridh = 20;
  grid = new Cell[gridw][gridh];
  
  int xinc = (int)(width/gridw);
  int yinc = (int)(height/gridh);
  
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
       grid[x][y] = new Cell(x,y,xinc,yinc);   
    }
  }
  
  
}

void draw(){
  background(200);
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
      grid[x][y].show();
    }
  }
}
