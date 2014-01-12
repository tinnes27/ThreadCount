

public class Requirement{
  
      ArrayList<Course> courses;    
      String name;
      String abrev_name;
      boolean expanded;
      boolean cat_expanded;
      float y_offset;
      float y_bottom;
      String displayString;
      Course selected;
      ColorPalette colors;
    
      public Requirement(String name, String abrev_name){
         this.name = name;
         this.abrev_name = abrev_name;
         this.courses = new ArrayList<Course>();
         this.expanded = false;
         this.cat_expanded = false;
         displayString = name;
         selected = null;
      } 
      void reset(){
       selected = null;
       expanded = false;
       cat_expanded = false;
       displayString = name; 
      }
      
      
    void setColors(ColorPalette c){
     colors = c;
   } 
     public boolean select(Course c){
       
       if(selected == c){
        
         selectedList[c.index] = false;
         c.selected = false;
         selected = null;
         lastSelected = null;
         displayString = name;
         return false;
       }
       else if(!selectedList[c.index]){
         selectedList[c.index] = true;
         if(selected!=null){
           selectedList[selected.index] = false;
           selected.selected = false;
         }
         c.selected = true;
         selected = c;
         lastSelected = c;
         displayString = c.courseNumber;
         return true;
       }  
       return false;
     }
     
     public boolean contains(float x, float y){
        if(!cat_expanded){
           return false; 
        }
       
        if(!expanded){
           if(x>=SIDEBAR_X_OFFSET+REC_HEIGHT && x<=WIDTH && y>=y_offset && y>= REC_HEIGHT/2 && y<y_bottom && y< HEIGHT-REC_HEIGHT/2 && y>REC_HEIGHT/2){
            return true;
          }
          return false;  
        }
        else{
          if(x>=SIDEBAR_X_OFFSET+REC_HEIGHT && x<=SIDEBAR_X_OFFSET+2*REC_HEIGHT && y>=y_offset && y<y_bottom && y< HEIGHT-REC_HEIGHT/2 && y>REC_HEIGHT/2)
            return true;
          return false;
        }
      }
      
      public void toggle(){
         expanded = !expanded;
         for(Course c : courses){
           
           c.rec_expanded = expanded; 
        }
      }
      
      public float draw(float y_offset){
        this.y_offset = y_offset;
        stroke(1);
        
        if(!expanded){
          if(selected != null){
            if(contains(mouseX, mouseY)){
              fill(colors.light_hover);
              highlightedCourse = selected;
            }
            else{
              fill(colors.light);
            }
          }
          else{
            if(contains(mouseX, mouseY)){
              fill(colors.medium_hover);
            }
            else {
              fill(colors.medium);
            }
          }
          rect(SIDEBAR_X_OFFSET + REC_HEIGHT, y_offset, REC_WIDTH, REC_HEIGHT);
          // if(selected != null){
          //   fill(0);
          // }
          // else{
          //   fill(255);
          // }
          fill(0);
          textFont(largeText);
          text(displayString, SIDEBAR_X_OFFSET+10 +REC_HEIGHT, y_offset+REC_HEIGHT/2+5);
          y_bottom=y_offset+REC_HEIGHT;
          return y_bottom;
        }
        else
        {
          float y_temp = y_offset;
          for(Course c : courses){
              y_temp = c.drawList(y_temp, c==selected);
          }
          if(selected != null){
            if(contains(mouseX, mouseY)){
              fill(colors.light_hover);
            }
            else {
              fill(colors.light);
            }
          }
          else{
            if(contains(mouseX, mouseY)){
              fill(colors.medium);
            }
            else {
              fill(colors.medium_hover);
            }
          }
          y_temp = max(MIN_CATEGORY_HEIGHT, y_temp-y_offset) + y_offset;
          rect(SIDEBAR_X_OFFSET + REC_HEIGHT, y_offset, CATEGORY_WIDTH, y_temp-y_offset);
          //fill(colors.light);
          // if((contains(mouseX, mouseY))&&(selected == null)){
            fill(0);
          // }
          // else{ 
          //   fill(0);
          // }
          textFont(largeText);

          if(name.length() > 10){
            translate(SIDEBAR_X_OFFSET + REC_HEIGHT+25, y_offset + 10 + textWidth(abrev_name) );
            rotate(-PI / 2);
            text(abrev_name,0,0);
            rotate(PI / 2);
            translate(-SIDEBAR_X_OFFSET-25-REC_HEIGHT, -(y_offset + 10 + textWidth(abrev_name)));
          
          }else{
            translate(SIDEBAR_X_OFFSET + REC_HEIGHT+25, y_offset + 10 + textWidth(name) );
            rotate(-PI / 2);
            
            text(name,0,0);
            rotate(PI / 2);
            translate(-SIDEBAR_X_OFFSET-25-REC_HEIGHT, -(y_offset + 10 + textWidth(name)));
          }
          y_bottom = y_temp;
          return y_bottom;//will change later
        }
      }
}

//Print all the Requirements
public void print_reqs(ArrayList<Requirement> list){
 
   for(int i = 0; i < list.size(); i++){
    
      print(list.get(i).name + ":  ");
      
      ArrayList<Course> c = list.get(i).courses;
      
      for(int j = 0; j < c.size(); j++){
         print(c.get(j).courseNumber + " "); 
      }
      
      println();
   } 
  
}


ArrayList<Requirement> format_reqs(Course[] list){
  
  ArrayList<Requirement> temp = new ArrayList<Requirement>();
  
  for(int i = 0; i < list.length; i++){
      
      int hit = 0;
    
      for(int j = 0; j < temp.size(); j++){
        
         Requirement r = temp.get(j);
         
         if(r.name.compareTo(list[i].requirement) == 0){
             temp.get(j).courses.add(list[i]);
             hit = 1;
         }
      }
      
      if(hit == 0){
         
          Requirement q = new Requirement( list[i].requirement, list[i].req_abrev );
          q.courses.add(list[i]);
          
          temp.add(q);
        
      }
  }
  return temp;
}
