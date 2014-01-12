/* I (Tim) didn't add this, I'm not sure if or where it's used */

class position{
 float x;
 float y;

  position(float x, float y){
   this.x = x;
   this.y = y;
  } 
}

  ArrayList<ArrayList<Course>> plot_path;
  int level;
  float cx = 340;
  float cy = 260;
  float cwh = 450;
  float delta = 100;
  float boxwh = 42;
  float off = 20;
  bigBoxes[][] masterBigBox = init_box_box(cx, cy, cwh, delta, boxwh);
  Course lastHighlighted = null;
  Course holdHighLight = null;
  
  void resetWheel(){
    lastHighlighted = null;
    lastSelected = null;
    holdHighLight = null;
    highlightedCourse = null;
    roots_in_Wheel.clear();
    inWheel.clear();
    selected_list.clear();
    for(int i = 0; i< masterBigBox.length; i++){
       for(int j = 0; j<masterBigBox[i].length; j++){
        bigBoxes b = masterBigBox[i][j];
         if(b != null && b.c != null){
            b.setActive(false);
         } 
       }
    }
  }
ArrayList<Course> currentPath = new ArrayList<Course>(); 
// draws current wheel
void drawWheel(){
  stroke(100);
  fill(255);
  ellipse(cx, cy, cwh, cwh);
  ellipse(cx, cy, cwh-delta, cwh-delta);
  ellipse(cx, cy, cwh-delta*2, cwh-delta*2);
  ellipse(cx, cy, cwh-delta*3, cwh-delta*3);
  ellipse(cx, cy, cwh-delta*4, cwh-delta*4);
  stroke(0);
  
  

  for(Requirement r : req_list){
     for(Course c :r.courses){
      c.isGrey= true;
     }
    
   } 
   for(int t = 0; t < masterBigBox.length; t++){
       for(int tt = 0; tt < masterBigBox[t].length; tt++){
          if(masterBigBox[t][tt] != null){
            masterBigBox[t][tt].contains(mouseX,mouseY);
            
          }
       } 
     }
     
 if(highlightedCourse!=null){
   highlightedCourse.setGrey();
  }
 else if(lastSelected != null){
    lastSelected.setGrey();
  }

  // confirm what is and what is not currently selected.
    for(int i = selected_list.size() -1; i >= 0; i--){
      if(selected_list.get(i).selected == false){
        if( roots_in_Wheel.contains( selected_list.get(i)) ){
            holdHighLight = selected_list.get(i);
        }
        //println("Course removed (end of problem zone) " + selected_list.get(i).courseNumber );
        selected_list.remove(i);
      } 
    }
    
    /* check if there is a highlighted course, or a new highlighted course */
    if(highlightedCourse != lastHighlighted){
        if(lastHighlighted != null){
          if(!roots_in_Wheel.contains(lastHighlighted)){
            remove_Prereqs_From_Wheel(lastHighlighted);
            lastHighlighted = null;
          }
        }
    }
    
    //remove deselected branches
     for(int k = roots_in_Wheel.size() -1; k >= 0; k--){ 
      if(!selected_list.contains(roots_in_Wheel.get(k) ) ){
          remove_Prereqs_From_Wheel(roots_in_Wheel.get(k) );
      }
     }
     
     for(int t = 0; t < masterBigBox.length; t++){
       for(int tt = 0; tt < masterBigBox[t].length; tt++){
          if(masterBigBox[t][tt] != null){
            //masterBigBox[t][tt].checkBox();
            if(masterBigBox[t][tt].c != null && masterBigBox[t][tt].c.highlightedWheel == true){
              //println("true in wheel " + masterBigBox[t][tt].c.courseNumber);
               plot_path = find_Pre_Chain(masterBigBox[t][tt].c);
            }
          }
       } 
    }
     
    // draw lines that connect the prereqs (selected courses only)
    drawLines();
    //drawOneConnectedPath();
   
    // draw all active boxes 
    for(int t = 0; t < masterBigBox.length; t++){
       for(int tt = 0; tt < masterBigBox[t].length; tt++){
          if(masterBigBox[t][tt] != null){
            masterBigBox[t][tt].checkBox();
          }
       } 
    }
    
    // once the cursor moves off the deselected course, it should be highlighable again
    if(holdHighLight != null && !holdHighLight.contains(mouseX, mouseY) ){
       holdHighLight = null; 
    }
    
    
  // draw all highlighted boxes
  if( (highlightedCourse != null) && (holdHighLight != highlightedCourse) && !roots_in_Wheel.contains(highlightedCourse) ){
    
    plot_path = find_Pre_Chain(highlightedCourse);
   
    for(int t = 0; t < plot_path.size(); t++){ 
      
       for(int tt = 0; tt < plot_path.get(t).size(); tt++){
        
           if( !inWheel.contains( plot_path.get(t).get(tt) ) ){
             int j = tt;
             while(masterBigBox[highlightedCourse.level-t][j] != null && masterBigBox[highlightedCourse.level-t][j].getActive() == true){
               j++;
               if(masterBigBox[highlightedCourse.level-t][j] == null ){
                 j = 0;
                 break;
               }
             }
               masterBigBox[highlightedCourse.level-t][j].setText( plot_path.get(t).get(tt) );
               masterBigBox[highlightedCourse.level-t][j].setActive(true);
               inWheel.add( plot_path.get(t).get(tt) );
           }
       } 
    }
    
    // draw lines first, so boxes go over them.
    
    drawLines();
    //drawOneConnectedPath();

    // then draw boxes
    for(int t = 0; t < masterBigBox.length; t++){
       for(int tt = 0; tt < masterBigBox[t].length; tt++){
          if(masterBigBox[t][tt] != null){
            masterBigBox[t][tt].checkBox();
            
          }
       } 
     }
 
     lastHighlighted = highlightedCourse;
  }// end if
 
  /* add selected course to wheel */
  if(lastSelected != null){
    
    if(!selected_list.contains(lastSelected) ){
      selected_list.add(lastSelected);
    }
    
    plot_path = find_Pre_Chain(lastSelected);
   
    for(int t = 0; t < plot_path.size(); t++){ 
      
       for(int tt = 0; tt < plot_path.get(t).size(); tt++){
        
           if( !inWheel.contains( plot_path.get(t).get(tt) ) ){
             int j = tt;
             while(masterBigBox[lastSelected.level-t][j] != null && masterBigBox[lastSelected.level-t][j].getActive() == true){
               j++;
               if(masterBigBox[lastSelected.level-t][j] == null ){
                 j = 0;
                 break;
               }
             }// end while
               masterBigBox[lastSelected.level-t][j].setText( plot_path.get(t).get(tt) );
               masterBigBox[lastSelected.level-t][j].setActive(true);
               masterBigBox[lastSelected.level-t][j].checkBox(); 
               inWheel.add( plot_path.get(t).get(tt) );
             }// end if
         }// end for
      }//end for
   } // end if
}// end function draw wheel

/* find all course prereqs */
ArrayList<ArrayList<Course>> find_Pre_Chain(Course c0){
  
  currentPath.clear();
  
  ArrayList<ArrayList<Course>> plot_path = new ArrayList<ArrayList<Course>>();
  
  ArrayList<Course> plist, edit;
  
  setLevel(0);
  
  edit = new ArrayList<Course>();
  
  if(!roots_in_Wheel.contains(c0) ){
     
     roots_in_Wheel.add(c0); 
  }
  
  
  if(!inWheel.contains(c0) ){
    c0.connected.clear();
    edit.add(c0);
    currentPath.add(c0);
    plist = c0.pre_req_list;
    
    // root level 
    plot_path.add(new ArrayList<Course>());  // level 0
    plot_path.get(0).add(c0);
    
    // first level of prereqs
    plot_path.add(new ArrayList<Course>()); // level 1
    
    for(Course pre : plist){
      if(!inWheel.contains(pre) ){
         pre.connected.clear(); 
      }
      c0.connected.add(pre);
      if(!edit.contains(pre) ){
         plot_path.get(1).add(pre);
         edit.add(pre); 
      }   
    }
    
    //second level of prereqs
    plot_path.add(new ArrayList<Course>());  // level 2
    
    if(plist.size() > 0 ){
       setLevel(1); 
    }
    
    int hit2 = 0;
    for(int j = 0; j < plot_path.get(1).size(); j++){
      
       plist = plot_path.get(1).get(j).pre_req_list;
       
         for(Course pre : plist){
            if(!inWheel.contains(pre) ){
               pre.connected.clear(); 
            }
            hit2 = 1;
            plot_path.get(1).get(j).connected.add(pre);
            if(!edit.contains(pre) ){
               edit.add(pre);
               plot_path.get(2).add(pre);
            }  
         }
    }
    
    if(hit2 == 1 ){
       setLevel(2); 
    }
    
    //thrid level of prereqs
    plot_path.add(new ArrayList<Course>());  // level 3
    int hit3 = 0;
    for(int j = 0; j < plot_path.get(2).size(); j++){
      
       plist = plot_path.get(2).get(j).pre_req_list;
       
         for(Course pre : plist){
            if(!inWheel.contains(pre) ){
               pre.connected.clear(); 
            }
            hit3 = 1;
            plot_path.get(2).get(j).connected.add(pre);
            if(!edit.contains(pre)){
               edit.add(pre);
               plot_path.get(3).add(pre);
            }    
         }
    }
    
    if(hit3 == 1 ){
       setLevel(3);
    }
    
     //forth level of prereqs
    plot_path.add(new ArrayList<Course>());  // level 4
    int hit4 = 0;
    for(int j = 0; j < plot_path.get(3).size(); j++){
      
       plist = plot_path.get(3).get(j).pre_req_list;
       
         for(Course pre : plist){
            if(!inWheel.contains(pre) ){
               pre.connected.clear(); 
            }
            hit4 = 1;
            plot_path.get(3).get(j).connected.add(pre);
            if(!edit.contains(pre)){
               edit.add(pre);
               plot_path.get(4).add(pre);
               
            }    
         }
    }
    
    if(hit4 == 1 ){
      setLevel(4); 
    }
    
    for(int k = getLevel(); k >= 0; k--){
       for(Course c : plot_path.get(getLevel() - k ) ){
          c.level = k; 
          currentPath.add(c);
         // println(c.courseNumber + " and level is " + k);
       }
    }
  }// end if
  return plot_path;
} // end function


/* find the correct level in the wheel for the current root course (the classes that's being added) */
int getLevel(){
   return level; 
}

/* set level of root course being added to wheel */
void setLevel(int l){
 level = l; 
}

/* remove all prereqs associated with the delected class from wheel */
void remove_Prereqs_From_Wheel(Course c0){
   ArrayList<Course> conn0 =  c0.connected;
   Integer level = c0.level;
   int isImputConnected = 0;
   if(level < 4){
     for(int i = 0; i < masterBigBox[level+1].length; i++){
        if( masterBigBox[level+1][i] != null){
          bigBoxes b = masterBigBox[level+1][i];
          if(b != null && b.c != null && b.getActive() == true && b.c.connected.contains(c0)){
            isImputConnected = 1;
           // println("hit parent " + b.c.courseNumber);
          }
        }
     }// end for
   }
   
   //println(isImputConnected + " token");
   if(isImputConnected != 1){
     
     for(int i = 0; i < masterBigBox[level].length; i++){
        if( masterBigBox[level][i] != null){
          bigBoxes b = masterBigBox[level][i];
        
           if(b != null && b.c != null && b.getActive() == true && b.c.courseNumber.compareTo(c0.courseNumber) == 0 ){
             b.setActive(false);
             //println("I'm a root that was removed " + c0.courseNumber);
             roots_in_Wheel.remove(c0);
             inWheel.remove(c0);
           }
        }
      }
     
     for(Course cor : conn0 ){
        if(!roots_in_Wheel.contains(cor) ){
          get_rid_of_pre_in_wheel(cor);
        }
     }
     
   }
   
}// end method

/* recursive helper method for prereq removal */

void get_rid_of_pre_in_wheel(Course c){
  
         ArrayList<Course> conn_array =  c.connected;
         
         int hit = 0;
         
         Integer next_level = c.level;
         
         for(int i = 0; i < masterBigBox[next_level+1].length; i++){
           bigBoxes b = masterBigBox[next_level+1][i];
           //println(c.courseNumber + " inside c0, connected list");
           if(b != null && b.c != null && b.getActive() == true && b.c.connected.contains(c)){
             //println("Course " + c.courseNumber + " is not removed becauste it is still connected to " + b.c.courseNumber);
             hit = 1;
           }
         }
         
         if(hit == 0){
           for(int i = 0; i < masterBigBox[next_level].length; i++){
              if( masterBigBox[next_level][i] != null){
                  bigBoxes b = masterBigBox[next_level][i];
               
                  if(b != null && b.c != null && b.getActive() == true && b.c.courseNumber.compareTo(c.courseNumber) == 0 ){
                    //println("Course " + b.c.courseNumber + " was removed ");
                     b.setActive(false);
                     
                     inWheel.remove(c);
                 }
              }
            }
       }
      
      if(conn_array.size() > 0){
        for( Course cc : conn_array ){
          if(!roots_in_Wheel.contains(cc) ){
            get_rid_of_pre_in_wheel(cc);
          }
        }
      }
   
}

void drawOneConnectedPath(){
  
  Course c = null;
  int layerBelow = 0;
 
  if(lastSelected != null){
    c = lastSelected;
  }
  else if(highlightedCourse != null ){//&& highlightedCourse != lastHighlighted){
    c = highlightedCourse;
    //println(c.courseNumber + " course check " + c.level);
  }
  
  for(Course w : inWheel){
     if(w.highlightedWheel == true){
         c = w;
     }
  }
  
  if(c != null && c.level != null){
   //println(c.courseNumber + " course check " + c.level);
   drawOneLineHelper(c, c.level ); 
   //println("selected course " + c.courseNumber);
  }
  
}

void drawOneLineHelper(Course c, int level){
  //println("got here");
  int layerBelow = 0;
  for(int tt = 0; tt < masterBigBox[level].length; tt++){
    
    if(masterBigBox[level][tt] != null){
              bigBoxes b = masterBigBox[level][tt];
              if(level > 0 && b.getActive() == true && b.c != holdHighLight && b.c.courseNumber.compareTo(c.courseNumber) == 0){
               //println("found c");
               layerBelow = 1;
                 ArrayList<Course> con = b.c.connected;
                 for(Course s : con){
                    for(int k = 0; k < masterBigBox[level].length; k++){
                       bigBoxes b2 = masterBigBox[level-1][k];
                       if(b2 != null && b2.getActive() == true && b2.c != holdHighLight && b2.c.courseNumber.compareTo(s.courseNumber) == 0 ){
                           float b1xa = b.x + b.wh/2;
                           float b1ya = b.y;
                           
                           float b2xa = b2.x+b2.wh/2;
                           float b2ya = b2.y+b2.wh;
                           
                           float xsum = pow(b1xa-b2xa, 2);
                           float ysum = pow(b1ya-b2ya, 2);
                           float length_1 = sqrt(xsum+ysum);
                           
                           //println("sumx " + xsum + " sumy = " + ysum + " length1 " + length_1 );
                           float b1xb = b.x + b.wh/2;    
                           float b1yb = b.y + b.wh;
                           
                           float b2xb = b2.x+b2.wh/2;
                           float b2yb = b2.y;
                           
                           float xsum2 = pow(b1xb-b2xb, 2);
                           float ysum2 = pow(b1yb - b2yb, 2);
                           float length_2 = sqrt(xsum2+ysum2);
                           
                           //println("sumx2 " + xsum2 + " sumy = " + ysum2 +  "b2xb " + b2xb + " " + " length1 " + length_2 );
                           strokeWeight(2);
                           stroke(0);
                           if(length_1 <= length_2){
                             line(b.x + b.wh/2, b.y, b2.x+b2.wh/2, b2.y+b2.wh+5);
                              triangle(b2.x + b2.wh/2, b2.y+b2.wh+2, b2.x + b2.wh/2-3, b2.y+b2.wh+5, b2.x + b2.wh/2+3, b2.y+b2.wh+5); 
                           }else{
                             line(b1xb , b1yb , b2xb, b2yb-5);
                             triangle(b2xb, b2yb-2, b2xb-3, b2yb-5, b2xb+3, b2yb-5);
                            
                           
                           }
                           strokeWeight(1);
                           stroke(0, 0, 0);
                           layerBelow = 1;  
                        }
                        if(s.level > 0){
                          drawOneLineHelper(s, level-1);
                        }
                    }//end for
                 } 
               }
             
            
              if(b.c != null && b.getActive() == true && b.c.pre_req_alt == true && b.c != holdHighLight && layerBelow == 0){
                for(int kk = 0; kk < masterBigBox[level].length; kk++){
                  bigBoxes b3 = masterBigBox[level][kk];
                    if(b3 != null && b3.c != null && b3.getActive() == true && b3.c != holdHighLight && b3.c.alt_for != null && b3.c.alt_for.courseNumber.compareTo(b.c.courseNumber) == 1 ){
                       stroke(200);
                       strokeWeight(1);
                       line(b.x+b.wh, b.y+b.wh/2, b3.x, b3.y+b3.wh/2);
                       line(b.x+b.wh+3 , b.y+b.wh/2+3, b3.x+3, b3.y+b3.wh/2+3);
                       stroke(0,0,0); 
                       strokeWeight(1);
                    }
                  }
              }
            }//end if
         } 
     } 
  

/* draw the lines connecting prereqs in the wheel */
void drawLines(){
  int layerBelow = 0;
 for(int t = 0; t < masterBigBox.length; t++){
         for(int tt = 0; tt < masterBigBox[t].length; tt++){
            if(masterBigBox[t][tt] != null){
              bigBoxes b = masterBigBox[t][tt];
              if(t > 0 && b.getActive() == true && b.c != holdHighLight){
                 layerBelow = 0;
                 ArrayList<Course> con = b.c.connected;
                 for(Course s : con){
                    for(int k = 0; k < masterBigBox[t].length; k++){
                       bigBoxes b2 = masterBigBox[t-1][k];
                       if(b2 != null && b2.getActive() == true && b2.c != holdHighLight && b2.c.courseNumber.compareTo(s.courseNumber) == 0 ){
                           float b1xa = b.x + b.wh/2;
                           float b1ya = b.y;
                           
                           float b2xa = b2.x+b2.wh/2;
                           float b2ya = b2.y+b2.wh;
                           
                           float xsum = pow(b1xa-b2xa, 2);
                           float ysum = pow(b1ya-b2ya, 2);
                           float length_1 = sqrt(xsum+ysum);
                           
                           //println("sumx " + xsum + " sumy = " + ysum + " length1 " + length_1 );
                           float b1xb = b.x + b.wh/2;    
                           float b1yb = b.y + b.wh;
                           
                           float b2xb = b2.x+b2.wh/2;
                           float b2yb = b2.y;
                           
                           float xsum2 = pow(b1xb-b2xb, 2);
                           float ysum2 = pow(b1yb - b2yb, 2);
                           float length_2 = sqrt(xsum2+ysum2);
                           if(currentPath.contains(b2.c) || b.c.highlightedWheel == true){
                           strokeWeight(2);
                           stroke(0);
                           if(length_1 <= length_2){
                             line(b.x + b.wh/2, b.y, b2.x+b2.wh/2, b2.y+b2.wh+5);
                              triangle(b2.x + b2.wh/2, b2.y+b2.wh+2, b2.x + b2.wh/2-3, b2.y+b2.wh+5, b2.x + b2.wh/2+3, b2.y+b2.wh+5); 
                           }else{
                             line(b1xb , b1yb , b2xb, b2yb-5);
                             triangle(b2xb, b2yb-2, b2xb-3, b2yb-5, b2xb+3, b2yb-5);
                            
                           
                           }
                           
                           }else{
                              strokeWeight(2);
                              stroke(200);
                           if(length_1 <= length_2){
                             line(b.x + b.wh/2, b.y, b2.x+b2.wh/2, b2.y+b2.wh+5);
                              //triangle(b2.x + b2.wh/2, b2.y+b2.wh+2, b2.x + b2.wh/2-3, b2.y+b2.wh+5, b2.x + b2.wh/2+3, b2.y+b2.wh+5); 
                           }else{
                             line(b1xb , b1yb , b2xb, b2yb-5);
                             //triangle(b2xb, b2yb-2, b2xb-3, b2yb-5, b2xb+3, b2yb-5);
                            
                           
                           }
                             
                           }
                           strokeWeight(1);
                           stroke(0);
                           layerBelow = 1;
                          
                        }
                    }//end for
                 } 
               }
             
            
              if(b.c != null && b.getActive() == true && b.c.pre_req_alt == true && b.c != holdHighLight && layerBelow == 1){
                for(int kk = 0; kk < masterBigBox[t].length; kk++){
                  bigBoxes b3 = masterBigBox[t][kk];
                    if(b3 != null && b3.c != null && b3.getActive() == true && b3.c != holdHighLight && b3.c.alt_for != null && b3.c.alt_for.courseNumber.compareTo(b.c.courseNumber) == 0 ){
                       stroke(200);
                       strokeWeight(1);
                       line(b.x+b.wh, b.y+b.wh/2, b3.x, b3.y+b3.wh/2);
                       line(b.x+b.wh+3 , b.y+b.wh/2+3, b3.x+3, b3.y+b3.wh/2+3);
                       stroke(0,0,0); 
                       strokeWeight(1);
                    }
                  }
              }
            }//end if
         } 
     } 
}




