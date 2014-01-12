public class Category{
  
     ArrayList<Requirement> reqs;
     String name;
     boolean expanded;
     float y_offset;
     float y_bottom;
     ColorPalette colors;
    
      public Category(String name, ColorPalette colors){
         this.name = name;
         this.reqs = new ArrayList<Requirement>();
         expanded = false;
         this.colors = colors;
      } 
      
      public void reset(){
        expanded = false; 
      }
      
      public boolean contains(float x, float y){
        if(!expanded){
          if(x>=SIDEBAR_X_OFFSET && x<=WIDTH && y>=y_offset && y<y_bottom && y< HEIGHT-REC_HEIGHT/2 && y>REC_HEIGHT/2){
            return true;
          }
          return false;  
        }
        else{
          if(x>=SIDEBAR_X_OFFSET && x<=SIDEBAR_X_OFFSET+REC_HEIGHT && y>=y_offset && y<y_bottom && y< HEIGHT-REC_HEIGHT/2 && y>REC_HEIGHT/2)
            return true;
          return false;
        }
      }
      
      public void toggle(){
        if(reqs.size() > 0){
          expanded = !expanded;
          for(Requirement r : reqs){
             r.cat_expanded = expanded; 
             if(expanded == false && r.expanded == true){
                r.toggle();
             }
          }
          
          
        }
      }
      
      public float draw(float y_offset){
        this.y_offset = y_offset;
        stroke(1);
        if(!expanded)
        {
          if (contains(mouseX, mouseY)){
            fill(colors.dark_hover);
          }
          else {
            fill(colors.dark);
          }
          rect(SIDEBAR_X_OFFSET, y_offset, CATEGORY_WIDTH + REC_WIDTH, REC_HEIGHT);
          fill(255);
          textFont(largeBoldText);
          text(name, SIDEBAR_X_OFFSET+10, y_offset+REC_HEIGHT/2+8);
          y_bottom=y_offset+REC_HEIGHT;
          return y_bottom;
        }
        else
        {
          float y_temp = y_offset;
          for(Requirement r : reqs){
              y_temp = r.draw(y_temp);
          }
          if (contains(mouseX, mouseY)){
            fill(colors.dark);
          }
          else {
            fill(colors.dark_hover);
          }
          rect(SIDEBAR_X_OFFSET, y_offset, CATEGORY_WIDTH, y_temp-y_offset);
          fill(255);
          textFont(largeBoldText);
          translate(SIDEBAR_X_OFFSET+27, /*(y_temp-y_offset)/2 +*/ y_offset+textWidth(name)+10);
          rotate(-PI / 2);
          text(name,0,0);
          rotate(PI / 2);
          translate(-SIDEBAR_X_OFFSET-27, -(/*(y_temp-y_offset)/2 + */y_offset+textWidth(name)+10));
          y_bottom = y_temp;
          return y_bottom;//will change later
        }
      }
}

//Print All the Categories
public void print_cats(ArrayList<Category> list){
   for(int i = 0; i < list.size(); i++){
      print(list.get(i).name + ":  ");
      
      ArrayList<Requirement> r = list.get(i).reqs;
      
      for(int j = 0; j < r.size(); j++){
         print(r.get(j).name + " ");
      }
      
      println();
   } 
}

ArrayList<Category> format_cats(ArrayList<Requirement> r){
  
  ArrayList<Category> temp = new ArrayList<Category>();
  
  for(int i = 0; i < r.size(); i++){
      
      int hit = 0;
    
      for(int j = 0; j < temp.size(); j++){
        
         Category c = temp.get(j);
         
         if(c.name.compareTo(r.get(i).courses.get(0).category) == 0){
             c.reqs.add(r.get(i));
             hit = 1;
         }
      }
      
      if(hit == 0){
         
          Category q = new Category( r.get(i).courses.get(0).category, colorGen.getColorPalette());
          q.reqs.add(r.get(i));
          
          temp.add(q);
        
      }
  }
  // Empty categories. Remove if we add more threads to the dataset
  temp.add(new Category("Intelligence", colorGen.getColorPalette()));
  temp.add(new Category("Devices", colorGen.getColorPalette()));
  temp.add(new Category("Information Internet...", colorGen.getColorPalette()));
  temp.add(new Category("Modelling & Simulation", colorGen.getColorPalette()));
  temp.add(new Category("Systems & Architecture", colorGen.getColorPalette()));
  temp.add(new Category("Theory", colorGen.getColorPalette()));
  return temp;
}

