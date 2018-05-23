boolean grid[][];
int gridw;
int gridh;
boolean paused = true;

void setup(){
  int sclx = 2;
  int scly = 2;
  size(500,500);
  gridw = 500/sclx;
  gridh = 500/scly;
 grid = new boolean[gridw][gridh]; 
 for(int x=0;x<gridw;x++){
   for(int y=0;y<gridh;y++){
    grid[x][y] = random(1) > 0.5;   
   }
 }
}

void draw(){
   background(255);
   float xinc = width/gridw;
   float yinc = height/gridh;
   
   for(int x=0;x<gridw;x++){
      for(int y=0;y<gridh;y++){
        if(grid[x][y]){
           fill(0); 
        }else{
          fill(255);
        }
        rect(x*xinc,y*yinc,xinc,yinc);
      }
   }
   
   if(!paused) updateGrid();
}

void updateGrid(){
  boolean[][] newGrid = new boolean[gridw][gridh];
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
      int neighborC = 0;
      if(grid[(x+gridw-1)%gridw][y]) neighborC++;
      if(grid[(x+gridw-1)%gridw][(y+gridh-1)%gridh]) neighborC++;
      if(grid[(x+gridw-1)%gridw][(y+1)%gridh]) neighborC++;
      if(grid[(x+1) % gridw][y]) neighborC++;
      if(grid[(x+1) % gridw][(y+gridh-1)%gridh]) neighborC++;
      if(grid[(x+1) % gridw][(y+1)%gridh]) neighborC++;
      if(grid[x][(y+gridh-1)%gridh]) neighborC++;
      if(grid[x][(y+1)%gridh]) neighborC++;
      
      if(neighborC<2){newGrid[x][y] = false;
      }else if(neighborC>3){ newGrid[x][y] = false;
      }else if(neighborC==3){ newGrid[x][y] = true;
      }else newGrid[x][y] = grid[x][y];
    }
  }
  
  grid = newGrid;
}

void keyPressed(){
   if(key == ' '){
     paused = !paused;
   }
}

void mousePressed(){
   float xinc = width/gridw;
   float yinc = height/gridh;
   int x = floor(mouseX/xinc);
   int y = floor(mouseY/yinc);
   
   grid[x][y] = !grid[x][y];
}
