
/* 
Test on corse prereqs, all courses with associated prereqs to see if data is formated correctly.
*/
void print_prereqs(Course[] list){
     
      for(int i = 0; i < list.length; i++){
       
       print(list[i].courseNumber + " ");
       ArrayList<Course> temp = list[i].pre_req_list;
       print("Course prereqs:  ");
       for(int j = 0; j < temp.size(); j++){
         Course p = temp.get(j);
         if(p.pre_req_alt == true ){
           println();
            println("Has Alt"); 
         }
          print(temp.get(j).courseNumber + " ");
          
       }
       if(temp.size() == 0){
          print("None "); 
       }
       println();
       
      } 
}

/*
Once data is uploaded from .csv file, go back over Array of Courses and assign an array of Courses that is their list of immediate prereqs, to each Course object.
*/
public void formatPreReqs(Course[] input, HashMap<String, Course> map){

     for(int i = 0; i < input.length; i++){
       
       ArrayList editedTokens = new ArrayList();
       
       String prereq_text_list = input[i].pre_requirement;
       
       //println("This is what we're currently parsing " + prereq_text_list);
       String delims = "[()|]+";
       String[] tokens = prereq_text_list.split(delims);  // individual courses, but could have extra blank tokens
       
       for(int m = 1; m < tokens.length; m++){
          if(tokens[m] != ""){
             editedTokens.add(tokens[m]);
          } 
       }
       
       String[] temp = prereq_text_list.split("");    // this is to find the | () or none action terms
          int j = 0;  // tally of courses added
          for(int k = 0; k < temp.length; k++){
             
              Course p = null;
              
              if(temp[k].matches("\\|")){
                
                p = map.get( editedTokens.get(j) );
                
                //println(p.courseNumber + " set flag");
                p.pre_req_alt = true;  // set flag so know that this only one option, others could replace it
                Course alt_temp = p;
                input[i].pre_req_list.add(p);  // add prereq course to arrayList
                int next = j + 1;
                
                p = map.get( editedTokens.get(next) );
                //p.pre_req_alt = true; // set flag so know that this is only one option, others could replace it
                
                // set alts
                
                alt_temp.alt_for = p;
                p.alt_for = alt_temp;
                j++;
              }
              else if(temp[k].matches("\\)") ){
                
                p = map.get(editedTokens.get(j));
                
                //println(p.courseNumber);
                input[i].pre_req_list.add(p);  // add prereq course to arrayList
                j++;
                
             }
          }
       }
     
}
