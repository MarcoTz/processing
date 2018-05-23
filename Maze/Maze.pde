Cell[][] grid;
int gridw;
int gridh;
Cell active;

void setup(){
  size(500,500);
  gridw = 20; 
  gridh = 20;
  grid = new Cell[gridw][gridh];
  
  int xinc = width/gridw;
  int yinc = height/gridh;
  for(int x=0;x<gridw;x++){
    for(int y=0;y<gridh;y++){
      grid[x][y] = new Cell(x,y,xinc,yinc);
    }
  }
  active = grid[0][gridh-1];
  active.active = true;
}

void draw(){
  background(200);
  for(int x=0;x<gridw;x++){
   for(int y=0;y<gridh;y++){
     grid[x][y].show();
   }
  }
  
  active.active = false;
  active.visited = true;
  int[] possible = {-1,-1,-1,-1};
  if(active.x != 0){
      //print("left");
      if(!grid[active.x-1][active.y].visited) possible[0] = LEFT;
  }
  if(active.x != gridw-1){
    //print("right");
    if(!grid[active.x+1][active.y].visited) possible[1] = RIGHT;
  }
  if(active.y != 0){
    //print("up");
    if(!grid[active.x][active.y-1].visited) possible[2] = UP;
  }
  if(active.y != gridh-1){
    //print("down");
    if(!grid[active.x][active.y+1].visited) possible[3] = DOWN;
  }
  int dir = floor(random(0,3));
  if(possible[0] == -1 && possible[1] == -1 && possible[2] == -1 && possible[3] ==-1){
    //no way to go
  }else{
    while(possible[dir]==-1) dir = (dir+1)%4;
  }
  
  if(possible[dir] == LEFT){
    active = grid[active.x-1][active.y];
  }else if(possible[dir] == RIGHT){
    active = grid[active.x+1][active.y];
  }else if(possible[dir] == UP){
    active = grid[active.x][active.y-1];
  }else if(possible[dir] == DOWN){
    active = grid[active.x][active.y+1];
  }
  active.active = true;
  
  
}
  
