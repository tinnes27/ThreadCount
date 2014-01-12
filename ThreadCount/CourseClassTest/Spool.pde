void drawSpool(){
 Course c;
 if(highlightedCourse != null){
  c = highlightedCourse;
 } 
 else if(lastSelected!= null){
  c = lastSelected;
 }  
 else {
   return;
 }
 
 int x = 1;
 int y = 1;
 for(Course cr : c.pre_req_list){
   x=max(drawPre(cr, 1, y),x);
   y++;
 }
 c.drawTree(1,0);
 
}

int drawPre(Course c, int x, int y){
  int X = x;
  int Y = y;
  
  for(Course cr : c.pre_req_list){
   X=drawPre(cr, X, Y);
   X++;
  }
  c.drawTree(X,Y);
  
  return X;
}


