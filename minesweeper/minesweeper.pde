Cell[][] grid;
int gridw = 50;
int gridh = 50;
int bombs = 500;
boolean gameOver = false;

void setup(){
 size(600,600);
 reset();
}

void reset(){
  gameOver = false;
 grid = new Cell[gridw][gridh];
  int[] bombx = new int[bombs];
 int[] bomby = new int[bombs];
 for(int i=0;i<bombs;i++){
    bombx[i] = floor(random(gridw));
    bomby[i] = floor(random(gridh));
 }
 
 for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
       grid[x][y] = new Cell(x,y); 
       int neighbors = 0;
       for(int i=0;i<bombs;i++){
          if(bombx[i] == x && bomby[i] ==y){grid[x][y].bomb = true;}
          if(bombx[i] == x+1){
            if(bomby[i] == y) neighbors++;
            if(bomby[i] == y-1) neighbors++;
            if(bomby[i] == y+1) neighbors++;
          }
          if(bombx[i] == x-1){
             if(bomby[i] == y) neighbors++;
             if(bomby[i] == y-1) neighbors++;
             if(bomby[i] == y+1) neighbors++;
          }
          
          if(bombx[i] == x){
           if(bomby[i] == y-1) neighbors++;
           if(bomby[i] == y+1) neighbors++;
          }
          
       }      
       
       grid[x][y].neighborBombs = neighbors;
    }
 }
}

void draw(){
 background(255);
 float xinc = width/gridw;
 float yinc = height/gridh;
 for(int x=0;x<gridw;x++){
  for(int y=0;y<gridh;y++){
    fill(255);
    if(grid[x][y].flagged){
     fill(255,0,0); 
    }
    rect(x*xinc,y*yinc,xinc,yinc);
    if(grid[x][y].uncovered){
      fill(200);
      if(grid[x][y].bomb) fill(0);
      rect(x*xinc,y*yinc,xinc,yinc);
      
      if(grid[x][y].neighborBombs!=0){
        fill(0);
        textAlign(LEFT);
        text(grid[x][y].neighborBombs,x*xinc,(y+1)*yinc);
      }
    }
     
  }
 }
}

void mousePressed(){
  if(gameOver){reset();return;}
   float xinc = width/gridw;
   float yinc = height/gridh;
   int x = floor(mouseX/xinc);
   int y = floor(mouseY/yinc);
   if(mouseButton==LEFT && !grid[x][y].flagged){
     if(grid[x][y].bomb){
        uncoverAll();
        gameOver = true;
     }else{
       uncoverNeighbors(x,y);
     }
   }else if(mouseButton==RIGHT){
     grid[x][y].flagged = !grid[x][y].flagged;
   }
   
}

void uncoverNeighbors(int x,int y){
  if(grid[x][y].uncovered){
    return;
  }
  grid[x][y].uncovered = true; 
  if(grid[x][y].neighborBombs == 0){
     if(x!=0) uncoverNeighbors(x-1,y);
     if(x!=gridw-1) uncoverNeighbors(x+1,y);
     if(y!=0) uncoverNeighbors(x,y-1);
     if(y!=gridh-1) uncoverNeighbors(x,y+1); 
     if(x!=0 && y!=0) uncoverNeighbors(x-1,y-1);
     if(x!=0 && y!=gridh-1) uncoverNeighbors(x-1,y+1);
     if(x!=gridw-1 && y!=0) uncoverNeighbors(x+1,y-1);
     if(x!=gridw-1 && y!=gridh-1) uncoverNeighbors(x+1,y+1);
  }
}

void uncoverAll(){
 for(int x=0;x<gridw;x++){
  for(int y=0;y<gridh;y++){
    grid[x][y].uncovered = true;
  }
 }
}
