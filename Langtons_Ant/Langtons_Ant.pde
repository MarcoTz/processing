Cell[][] grid;
int gridw;
int gridh;
Ant ant;
boolean paused = false;

void setup(){
  size(500,500);
  gridw = 100;
  gridh = 100;
  grid = new Cell[gridw][gridh];
  
  int xinc = (int)(width/gridw);
  int yinc = (int)(height/gridh);
  
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
       grid[x][y] = new Cell(x,y,xinc,yinc);   
    }
  }
  
  ant = new Ant(gridw/2,gridh/2,xinc,yinc,gridw-1,gridh-1);
  
  
}

void draw(){
  background(200);
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
      grid[x][y].show();
    }
  }
  ant.show();
  
  if(!paused){
    if(grid[ant.x][ant.y].c == color(255)){
      grid[ant.x][ant.y].c = color(0);
      ant.dir = (ant.dir+1)%4;
    }else{
     grid[ant.x][ant.y].c = color(255);
     ant.dir = (ant.dir+4-1)%4;
    }
    
    ant.move();
  }
}

void keyPressed(){
 if(key == ' '){
   paused = !paused;
 }
}

void mousePressed(){
  int xinc = (int)(width/gridw);
  int yinc = (int)(height/gridh);
  int x = mouseX/xinc;
  int y = mouseY/yinc;
  if(grid[x][y].c == color(255)) grid[x][y].c = color(0);
  else grid[x][y].c = color(255);
}
