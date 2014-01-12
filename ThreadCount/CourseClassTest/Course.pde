public class Course{
   int index;
   String courseNumber;
   String courseTitle;
   String category;
   String sub_category;
   String requirement;
   String pre_requirement;
   String req_abrev;
   int hours;
   String term;
   String description;
   ArrayList<Course> pre_req_list;
   boolean pre_req_alt;
   Course alt_for;
   boolean selected;
   boolean highlighted;
   boolean highlightedWheel;
   ArrayList<Course> connected;
   Integer level;
   boolean isGrey;
   
   
   float y_offset;
   float y_bottom;
   boolean rec_expanded;
   ColorPalette colors;
   
   public Course(String courseNumber, String courseTitle, String category, String sub_category, 
   String requirement, String pre_requirement, int hours, String term, String req_abrev, String description, int index){
       this.index = index;
       this.courseNumber = courseNumber;
       this.courseTitle = courseTitle;
       this.category = category;
       this.sub_category = sub_category;
       this.requirement = requirement;
       this.pre_requirement = pre_requirement;
       this.hours = hours;
       this.term = term;
       this.description = description;
       this.req_abrev = req_abrev;
       this.pre_req_list = new ArrayList<Course>();
       this.pre_req_alt = false;
       this.alt_for = null;
       this.selected = false;
       this.highlighted = false;
       this.highlightedWheel = false;
       this.rec_expanded = false;
       this.connected = new ArrayList<Course>();
       this.level = null;
       this.isGrey = true;
   }

   void reset(){
     selected = false;
     highlighted = false;
     highlightedWheel = false;
     rec_expanded = false;
     isGrey = true;
   }
   
   void setColors(ColorPalette c){
     colors = c;
   } 
   
   void setGrey(){
     isGrey = false;
     for(Course c: pre_req_list){
      c.isGrey = false;
      c.setGrey();
     } 
   }
   public boolean contains(float x, float y){
        if(!rec_expanded){
          return false; 
        }
        if(selectedList[index] && !selected){
          return false;
        }
        if(x>=SIDEBAR_X_OFFSET+2*REC_HEIGHT && x<=WIDTH && y>=y_offset && y>= REC_HEIGHT/2 && y<y_bottom && y< HEIGHT-REC_HEIGHT/2 && y>REC_HEIGHT/2){
          return true;
        }
       return false;  
        
   }
   
   void drawTree(int x, int y){
     if(selected){
       fill(colors.medium);
     }
     else{
       fill(colors.light);
     }
     rect( 10+(70+10)*x, 10+(20+10)*y, 70, 20);
     if(selected){
       fill(0,0,0);
     }
     else{
       fill(colors.dark);
     }
     textFont(smallBoldText);
     text(courseNumber,10+(70+10)*x+5,10+(20+10)*y+15);
   }
   
   public float drawList(float y_offset, boolean rec_selected){
        highlighted = highlightedWheel;
        this.y_offset = y_offset;
        stroke(1);
        if(contains(mouseX, mouseY) || highlighted){
          if(selected){
            fill(colors.light_hover);
          }
          else if(selectedList[index]){
            fill(200,200,200);
          }
          else{
            fill(colors.light);
          }
          highlighted = true;
          highlightedCourse = this;
        }
        else if(rec_selected){
          fill(colors.light);
        }
        else if(selectedList[index]){
          fill(200,200,200);
        }
        else{
          fill(colors.medium_hover);
        }
        rect(SIDEBAR_X_OFFSET + 2*REC_HEIGHT, y_offset, REC_WIDTH, REC_HEIGHT);
        // if(rec_selected){
        //   fill(255,255,255);
        // }
        // else if(highlighted){
        //   fill(255,255,255); 
        // }
        // else if(selectedList[index]){
        //   fill(100,100,100); 
        // }
        // else{
        //   fill(colors.dark);
        // }
        fill(0);
        textFont(largeText);
        text(courseNumber, SIDEBAR_X_OFFSET+10 + 2*REC_HEIGHT, y_offset+REC_HEIGHT/2+5);
        y_bottom=y_offset+REC_HEIGHT;
        return y_bottom;
          
   }
        
}
