boolean isHome;
ArrayList<Category> cat_list;
ArrayList<Requirement> req_list;
StringList courseList;
boolean[] selectedList;
float SIDEBAR_X_OFFSET = 700;
float SIDEBAR_WIDTH = 300;
float OPTIONS_X_OFFSET = SIDEBAR_X_OFFSET-50;
float CATEGORY_WIDTH = 40;
float REC_WIDTH = SIDEBAR_WIDTH - CATEGORY_WIDTH;
float SIDEBAR_HEIGHT = 750;
float REC_HEIGHT = 40;
float MIN_CATEGORY_HEIGHT = REC_HEIGHT*4;  
int HEIGHT = 700;
int WIDTH = 1000;
float Y_OFFSET_MIN = 0;
float Y_OFFSET_MAX = REC_HEIGHT/2;
float Y_OFFSET = Y_OFFSET_MAX;
ColorGenerator colorGen = new ColorGenerator();
Table table;
PFont largeText;
PFont largeBoldText;
PFont regText;
PFont smallBoldText;
PFont giantText;
ArrayList<Course> inWheel = new ArrayList<Course>();
ArrayList<Course> roots_in_Wheel  = new ArrayList<Course>();
HashMap<String, ArrayList<ArrayList<Course>> > prereqpaths;
Option clearAll = new Option("X Clear", OPTIONS_X_OFFSET, 17);
Course highlightedCourse;
Course lastSelected;
ArrayList<Course> selected_list;
HashMap<String, Course> map;

void draw()
{
  if(isHome){
    drawHome();
  }
  else{
  highlightedCourse = null;
  fill(255, 255, 255);
  //fill(0,0,0);
  rect(0,0,WIDTH, HEIGHT);
  //rect(WIDTH-SIDEBAR_WIDTH,0,WIDTH, HEIGHT);
  //Handle Scrolling of sidebar and drawing of the sidebar
  if(Y_OFFSET<Y_OFFSET_MIN)
    //Y_OFFSET = constrain(Y_OFFSET_MIN+HEIGHT-REC_HEIGHT,Y_OFFSET_MIN,Y_OFFSET_MAX);
      Y_OFFSET = constrain((Y_OFFSET_MIN)+Y_OFFSET+HEIGHT-REC_HEIGHT,Y_OFFSET_MIN,Y_OFFSET_MAX);  
  float y_offset = Y_OFFSET;
  for(Category c : cat_list)
  {
     y_offset = c.draw(y_offset);
  }

  Y_OFFSET_MIN =  -1*(y_offset-Y_OFFSET)+1.5*REC_HEIGHT;
  if(mousePressed){
    if(Y_OFFSET<Y_OFFSET_MAX && scrollUp(mouseX, mouseY)){
     Y_OFFSET += 3;
    }
    else if(Y_OFFSET>Y_OFFSET_MIN && scrollDown(mouseX,mouseY)&&y_offset >HEIGHT){
     Y_OFFSET -= 3;
    }
  }
  drawScroll(y_offset);
  //drawSpool();
  drawWheel();
  //find_prereq_chain();
  //DOD 
  drawDOD();
  drawOptions(OPTIONS_X_OFFSET);
  }
}

void setup(){
  isHome = true;
  size(WIDTH,HEIGHT);
  background(250);
 
  initFonts(); 
  selected_list = new ArrayList<Course>();
  table = loadTable("threadCountData.csv", "header");
   
   //println(table.getRowCount() + " total rows");
   
   int number_of_rows = table.getRowCount();
   //println("Here are the number of rows " + number_of_rows);
   
   Course[] masterList = new Course[number_of_rows];
   courseList = new StringList();
   int i = 0;
   int si = 0;
   for(TableRow row : table.rows()){
     if(!courseList.hasValue(row.getString("CourseNumber"))){
       courseList.append(row.getString("CourseNumber"));
       si++;
     }
     // println(i + " " + si+" " + row.getString("CourseNumber") + ".");
      masterList[i] = new Course( row.getString("CourseNumber"), row.getString("CourseTitle"), 
      row.getString("Category"), row.getString("Sub-Category"), row.getString("Requirement"), 
      row.getString("Pre-Requirement"), row.getInt("Hours"), row.getString("Term"), row.getString("ReqAbrev"),
      row.getString("Description"),si );

      i++; 
   }
   
   map = new HashMap<String, Course>();
   for(int j = 0; j < masterList.length; j++){
      map.put(masterList[j].courseNumber, masterList[j]); 
   }
   
   prereqpaths = new HashMap<String, ArrayList<ArrayList<Course>> >();

   selectedList = new boolean[si+1];
   formatPreReqs(masterList, map);
   
   
   req_list = format_reqs(masterList);
   
   cat_list = format_cats(req_list);
 
   
   for(Category c: cat_list){
     for(Requirement r: c.reqs){
       r.setColors(c.colors);
       for(Course cr: r.courses){
        cr.setColors(c.colors);
       } 
     }  
     
   }
     
}

public void mouseReleased(){
    isHome = false;
    if(clearAll.contains(mouseX, mouseY)){
     reset(); 
    }
    for(Category c : cat_list){
      if(c.contains(mouseX, mouseY) ){
        c.toggle();
        return;
      }
    }
   for(Requirement r : req_list){
     for(Course c :r.courses){
      if(c.contains(mouseX, mouseY)){
        r.select(c);
      } 
     }
     if(r.contains(mouseX, mouseY) ){
       r.toggle();
     }
    
   } 
}

public void reset(){
  resetWheel();
  inWheel.clear();
  roots_in_Wheel.clear();
  highlightedCourse = null;
  lastSelected = null;
  selected_list.clear();
  for(int i = 0; i<selectedList.length; i++){
     selectedList[i] = false; 
  }
   for(Category c : cat_list){
      c.reset();
    }
   for(Requirement r : req_list){
     for(Course c :r.courses){
      c.reset(); 
     }
     r.reset();
    
   } 
}










