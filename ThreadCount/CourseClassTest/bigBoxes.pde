/* these are the cells that will appear in the wheel */

class bigBoxes{
  
   float x, y, wh;
   String t1, t2;
   boolean active, current;
   float x_mid, y_mid;
   Course c;
   
   bigBoxes(float x, float y, float wh){
     this.x = x;
     this.y = y;
     this.wh = wh;
     this.active = false;
     this.current = false;
     this.t1 = null;
     this.t2 = null;
     this.c = null;
     this.x_mid = x/2;
     this.y_mid= y/2;
   }
   
   boolean contains(float xTest, float yTest){
     
     if(this.active == false){
       return false;
     }
     if(xTest >=x && xTest<= x+wh &&yTest >=y && yTest <= y+wh){
       highlightedCourse = c;
       c.highlighted = true; 
       c.highlightedWheel = true;
       return true;
     }
     else{ 
        if(highlightedCourse != c)
          c.highlighted = false;
        c.highlightedWheel = false;
        return false; 
     }
     
   }
   
   void setText(Course c){
      this.c = c;
      String[] temp = c.courseNumber.split("");
      StringBuilder department = new StringBuilder();
      StringBuilder number = new StringBuilder();
      int hit = 0;
      int k = 0;
      for(k = 1; k < temp.length; k++){
     
        if(temp[k].matches("[A-Z]") ){
            department.append(temp[k]);
        }else{
          hit = 1;
        }
      
        if(hit == 1){
           break; 
        }
      }
    
      for(int j = k; j < temp.length; j++){
         number.append(temp[j]); 
      }
    
      this.t1 = department.toString();
      this.t2 = number.toString();
   }
   
   void setActive(boolean value){
      this.active = value; 
   }
   
   boolean getActive(){
      return this.active; 
   }
   
   //IE DRAW
   void checkBox(){
     if(this.active == true){
       //contains(mouseX,mouseY);
       // cx - 20, cy-cwh+delta*4, boxwh, boxwh
        if(c.isGrey == false){
          if(c.selected && c.highlighted){
            fill(c.colors.light_hover);
          }
          else if(c.selected){
            fill(c.colors.light); 
          }
          else if(c.highlighted){
            fill(c.colors.medium_hover, 230); 
          }
          else{
            fill(c.colors.medium, 200); 
          }
        }
        else{
         fill(200); 
        }
        rect(this.x, this.y, this.wh, this.wh); 
        fill(0,0,0);
        textFont(smallBoldText); 
        //this.t1,cx-16, cy-cwh+delta*4 +17
        text(this.t1,this.x+4, this.y+17);
      
         // his.t2,cx-16, cy-cwh+delta*4 +32
        text(this.t2,this.x+4,this.y+32); 
      }
   }
   
   Course checkCourse(){
      return this.c; 
   } 
}

/* initialize positions of big boxes */

bigBoxes[][] init_box_box(float cx, float cy, float cwh, float delta, float boxwh){
  float off = 20;
  bigBoxes[][] bigBox = new bigBoxes[5][20];
  
  //R0
  bigBox[0][0] = new bigBoxes(cx - off, cy-cwh+delta*2, boxwh);
  bigBox[0][1] = new bigBoxes(cx - off+delta*0.88, cy-cwh+delta*2.125, boxwh);
  bigBox[0][2] = new bigBoxes(cx - off+delta*1.7, cy-cwh+delta*2.7, boxwh);
  bigBox[0][3] = new bigBoxes(cx - off+delta*2.16, cy-cwh+delta*3.4, boxwh);
  bigBox[0][4] = new bigBoxes(cx - off+delta*2.35, cy-cwh+delta*4.25, boxwh);
  bigBox[0][5] = new bigBoxes(cx - off+delta*2.17, cy-cwh+delta*5.15, boxwh);
  bigBox[0][6] = new bigBoxes(cx - off+delta*1.7, cy-cwh+delta*5.88, boxwh );
  bigBox[0][7] = new bigBoxes(cx - off+delta*0.89, cy-cwh+delta*6.45, boxwh );
  bigBox[0][8] = new bigBoxes(cx - off, cy-cwh+delta*6.5, boxwh);
  bigBox[0][9] = new bigBoxes(cx -delta*1.11, cy-cwh+delta*6.45, boxwh );
  bigBox[0][10] = new bigBoxes(cx-delta*1.9, cy-cwh+delta*5.88, boxwh );
  bigBox[0][11] = new bigBoxes(cx-delta*2.4, cy-cwh+delta*5.15, boxwh );
  bigBox[0][12] = new bigBoxes(cx - delta*2.6, cy-cwh+delta*4.25, boxwh );
  bigBox[0][13] = new bigBoxes(cx-delta*2.39, cy-cwh+delta*3.4, boxwh );
  bigBox[0][14] = new bigBoxes(cx-delta*1.9, cy-cwh+delta*2.7, boxwh );
  bigBox[0][15] = new bigBoxes(cx -delta*1.1, cy-cwh+delta*2.125, boxwh );
  
  //R1
  bigBox[1][0] = new bigBoxes(cx - off, cy-cwh+delta*2.5, boxwh );
  bigBox[1][1] = new bigBoxes(cx - off+delta*0.86, cy-cwh+delta*2.7, boxwh );
  bigBox[1][2] = new bigBoxes(cx - off+delta*1.56, cy-cwh+delta*3.4, boxwh );
  bigBox[1][3] = new bigBoxes(cx - off+delta*1.7, cy-cwh+delta*4.25, boxwh );
  bigBox[1][4] = new bigBoxes(cx - off+delta*1.59, cy-cwh+delta*5.15, boxwh );
  bigBox[1][5] = new bigBoxes(cx - off+delta*0.86, cy-cwh+delta*5.88, boxwh );
  bigBox[1][6] = new bigBoxes(cx - off, cy-cwh+delta*6, boxwh );
  bigBox[1][7] = new bigBoxes(cx -delta*1.07, cy-cwh+delta*5.88, boxwh );
  bigBox[1][8] = new bigBoxes(cx-delta*1.8, cy-cwh+delta*5.15, boxwh );
  bigBox[1][9] = new bigBoxes(cx-delta*1.95, cy-cwh+delta*4.25, boxwh );
  bigBox[1][10] = new bigBoxes(cx-delta*1.78, cy-cwh+delta*3.4, boxwh );
  bigBox[1][11] = new bigBoxes(cx -delta*1.08, cy-cwh+delta*2.7, boxwh );
  
  //R2
  bigBox[2][0] = new bigBoxes(cx - off, cy-cwh+delta*3, boxwh );
  bigBox[2][1] = new bigBoxes(cx-off+delta*0.81, cy-cwh+delta*3.4, boxwh );
  //rect(cx-off+delta*1.2, cy-cwh+delta*4.25, boxwh, boxwh);
  bigBox[2][2] = new bigBoxes(cx-off+delta*1.2, cy-cwh+delta*4.25, boxwh);
  bigBox[2][3] = new bigBoxes(cx-off+delta*0.84, cy-cwh+delta*5.15, boxwh );
  bigBox[2][4] = new bigBoxes(cx - off, cy-cwh+delta*5.5, boxwh );
  bigBox[2][5] = new bigBoxes(cx-delta*1.05, cy-cwh+delta*5.15, boxwh );
  //rect(cx-delta*1.43, cy-cwh+delta*4.25, boxwh, boxwh);
  bigBox[2][6] = new bigBoxes(cx-delta*1.43, cy-cwh+delta*4.25,boxwh);
  bigBox[2][7] = new bigBoxes(cx-delta*1.03, cy-cwh+delta*3.4, boxwh );
  
  //R3
  bigBox[3][0] = new bigBoxes(cx - off, cy-cwh+delta*3.5, boxwh);
  bigBox[3][1] = new bigBoxes(cx+delta*0.5, cy-cwh+delta*4.25, boxwh);
  bigBox[3][2] = new bigBoxes(cx - off, cy-cwh+delta*5, boxwh);
  bigBox[3][3] = new bigBoxes(cx-delta*0.91, cy-cwh+delta*4.25, boxwh);
  
  //R4
  bigBox[4][0] = new bigBoxes(cx - off, cy-cwh+delta*4, boxwh);
  bigBox[4][1] = new bigBoxes(cx - off, cy-cwh+delta*4.5, boxwh);
 
  return bigBox;
  
}
