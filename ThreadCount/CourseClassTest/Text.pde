public void initFonts(){
   largeText = createFont("Gisha", 20);
   largeBoldText = loadFont("largeBoldText.vlw");
   regText = createFont("Gisha", 16);
   giantText = loadFont("giantBold.vlw");
   smallBoldText = loadFont("smallBoldText.vlw");
   textFont(largeText);
  
}

public void drawDOD(){
  //fill(0,0,0);
  fill(255,255,255);
  noStroke();
   rect(0,HEIGHT*3/4-20,WIDTH-SIDEBAR_WIDTH,HEIGHT); 
   stroke(4);
   Course c;
  if(highlightedCourse!=null){
   c=highlightedCourse;
  }
  else if(lastSelected != null){
    c = lastSelected;
    
  }
  else{
   return; 
  }
  //fill(255,255,255);
 fill(0,0,0); 
   textFont(largeBoldText);
   text(c.courseNumber,500, HEIGHT*3/4 +15); 
   text(c.courseTitle,30, HEIGHT*3/4 + 15);
   textFont(regText);
   text(c.term,30,HEIGHT*3/4+40);
   text(c.hours+" credit hours",500,HEIGHT*3/4+40);
   
   // build the pre-requisite string
   
   StringBuilder preStr = new StringBuilder();
   preStr.append( "Prerequisites:  " );
   
   ArrayList<Course> pre_list = c.pre_req_list;
   
   if( pre_list.size() == 0 ){
     preStr.append( "None" );
     String p = preStr.toString();
     text(p, 30, HEIGHT*3/4+60);
   }
   else{
   
     for(int i = 0; i < pre_list.size()-1; i++){
         preStr.append(pre_list.get(i).courseNumber);
         if( pre_list.get(i).pre_req_alt == true ){ //&& i < pre_list.size() -1 && pre_list.get(i+1).pre_req_alt == true){
           preStr.append(" or ");
         }else{
           preStr.append(", ");
         }
     }
     
     preStr.append(pre_list.get(pre_list.size()-1).courseNumber);
     String p = preStr.toString();
     text(p, 30, HEIGHT*3/4+60);
   }
   
   
   // initialize description string
   int max_width = 90;
   String d = c.description;
   int d_length = d.length();
   
   // if description will fit on one line
   if(d_length < max_width){
     text(d, 30, HEIGHT*3/4 + 80);
   }
   else{
     
      String delims = " ";
      String[] token = d.split(delims);
      int count = 0;
      int j = 0;
      int k = 0;
      
      //break description into first line
      StringBuilder sbStr = new StringBuilder();
      
      for (int i = 0, il = token.length; i < il; i++) {
        if (i > 0){
            sbStr.append(delims);
            count++;
        }
        count += token[i].length();
        if(count > max_width){
          j = i;
          break;
        }
        sbStr.append(token[i]);
        
        
      }
      String temp = sbStr.toString();
      text(temp, 30, HEIGHT*3/4 + 80);
      
      //break description into second line.
      
      if(j != token.length-1){
        StringBuilder sbStr2 = new StringBuilder();
        
        count = 0;
        for (int i = j, il = token.length; i < il; i++) {
          if (i > j){
            sbStr2.append(delims);
            count++;
          }
          count += token[i].length();
          if(count > max_width){
            j = i;
            break;
          }
          sbStr2.append(token[i]);
          k = i;
        }
        
        String temp2 = sbStr2.toString();
        text(temp2, 30, HEIGHT*3/4 + 100);
      }
     
      // third line of description
      
      if(k != token.length-1){
        StringBuilder sbStr3 = new StringBuilder();
        
        count = 0;
        for (int i = j, il = token.length; i < il; i++) {
          if (i > j){
            sbStr3.append(delims);
            count++;
          }
          count += token[i].length();
          if(count > max_width){
            j = i;
            break;
          }
          sbStr3.append(token[i]);
          k = i;
          
        }
        
        String temp3 = sbStr3.toString();
        text(temp3, 30, HEIGHT*3/4 + 120);
      }
      
      // fourth line of description
      
      if(k != token.length-1){
        StringBuilder sbStr4 = new StringBuilder();
        
        count = 0;
        for (int i = j, il = token.length; i < il; i++) {
          if (i > j){
            sbStr4.append(delims);
            count++;
          }
          count += token[i].length();
          if(count > max_width){
            j = i;
            break;
          }
          sbStr4.append(token[i]);
          k = i;
          
        }
        
        String temp4 = sbStr4.toString();
        text(temp4, 30, HEIGHT*3/4 + 140);
      }
   }
}
