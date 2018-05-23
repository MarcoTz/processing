ArrayList<Vertex> vertices;
ArrayList<Edge> edges;
Vertex current = null;
Edge active = null;
int buttonw = 60;
int buttonh = 20;

void setup(){
  size(500,500);
  vertices = new ArrayList();
  edges = new ArrayList();
}

void draw(){
  background(255);
  
  //draw all vertices
  noStroke();
  for(int i=0;i<vertices.size();i++){
      Vertex v = vertices.get(i);
      
      //if the vertex is selected, draw it in red
      if(v.selected){
        fill(255,0,0);
      }else{
        fill(0);
      }
      
      //draw the ellipse
      ellipse(v.x, v.y,v.radius,v.radius);
  }
  
  //draw all edges
  strokeWeight(2);
  stroke(0);
  for(int i=0;i<edges.size();i++){
    Edge e = edges.get(i);
    if(e.selected){
      stroke(255,0,0);
    }
    line(e.v1.x,e.v1.y,e.v2.x,e.v2.y);
  }
  
  //draw the delete button

  noFill();
  stroke(0);
  strokeWeight(1);
  rect(0,height-buttonh, buttonw, buttonh);
  fill(0);
  textSize(18);
  text("Delete",0,height-5);
}

void mousePressed(){
  //save if any vertex was clicked
  boolean clicked = false;
  
  //if any edge was clicked
   for(int i=0;i<edges.size();i++){
      Edge e = edges.get(i);
      if(e.inside(mouseX, mouseY) && current == null){
        if(e == active){
          e.selected = false;
          active = null;
        }else{
          if(active != null){
            active.selected = false;
          }
          e.selected = true;
          active = e;
        }
        clicked = true;
      }
    }
    
  //check if any vertex was clicked
  for(int i=0;i<vertices.size();i++){
    Vertex v = vertices.get(i);
    if(v.inside(mouseX, mouseY) && active==null){
      clicked = true;
      //if the current vertex was clicked and no other is currently active
      //set the current as active ans select it
      if(current == null){
        current = v;
        v.selected = true;
      //if a different vertex is selected connect the two
      }else{
        if(v != current){
          edges.add(new Edge(v, current));
        }
        current.selected = false;
        current = null;
      }
    }
  }
  
  //if no vertex or edge was clicked, add a new one
  
  if(!clicked && current == null && active == null && !(mouseX < buttonw && mouseY > height-buttonh)){
    vertices.add(new Vertex(mouseX,mouseY,8));
  }
  
  //if the button was clicked
  if(mouseX < buttonw && mouseY > height-buttonh){
    if(current != null){
      //int index = vertices.indexOf(current);
      for(int i=0;i<edges.size();i++){
        Edge curr = edges.get(i);
        if(curr.v1 == current || curr.v2 == current){
           edges.remove(curr); 
        }
        
      }
      vertices.remove(current);
      current = null;
    }
    if(active != null){
      edges.remove(active);
      active = null;
    }
  } 
}
