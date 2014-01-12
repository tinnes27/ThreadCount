

void testAllMinBoxes(float cx,float cy,float cwh,float delta,float boxwh){
  
  float mwh = boxwh/2;
  float pad = 17;
  fill(255);
    
  //min R4_0
  rect(cx-pad*2.2, cy-cwh+delta*4+mwh/2, mwh, mwh);
  
  //min R4_1
  rect(cx+pad, cy-cwh+delta*4+mwh/2, mwh, mwh);
  
  //min R4_2
  rect(cx+pad, cy-cwh+delta*4.5+mwh*0.9, mwh, mwh);
  
  //min R4_3
  rect(cx-pad*2.2, cy-cwh+delta*4.5+mwh*0.9, mwh, mwh);
  
  
  //R3
  // min R3_0 
  rect(cx-pad*2.6, cy-cwh+delta*3.5+mwh/2*0.8, mwh, mwh); 
  
  // min R3_1 
  rect(cx+pad*1.5, cy-cwh+delta*3.5+mwh/2*0.8, mwh, mwh); 
      
  // min R3_2 
  rect(cx+pad*4, cy-cwh+delta*4+mwh/2-13, mwh, mwh); 
      
  // min R3_3 
  rect(cx+pad*4, cy-cwh+delta*4.5+mwh+13, mwh, mwh); 
     
  // min R3_4
  rect(cx+pad*1.5, cy-cwh+delta*5+mwh/2+11, mwh, mwh); 
  
  // min R3_5
  rect(cx-pad*2.6, cy-cwh+delta*5+mwh/2+11, mwh, mwh); 
  
  // min R3_6
  rect(cx-pad*5.2, cy-cwh+delta*4.5+mwh+13, mwh, mwh); 
  
  // min R3_7 
  rect(cx-pad*5.2, cy-cwh+delta*4+mwh/2-13, mwh, mwh);
  
  
 
  
  //R2
  // min R2_0 
  rect(cx-pad*2.6, cy-cwh+delta*3+mwh-15, mwh, mwh); 
  
  // min R2_1 
  rect(cx+pad*1.5, cy-cwh+delta*3+mwh-15, mwh, mwh); 
  
  // min R2_2 
  rect(cx+pad*4.42, cy-cwh+delta*3+mwh+8, mwh, mwh); 
  
  // min R2_3
  rect(cx+pad*6.4, cy-cwh+delta*3.5+mwh/2+5, mwh, mwh); 
  
  // min R2_4
  rect(cx+pad*7.3, cy-cwh+delta*4+mwh/2, mwh, mwh); 
  
  // min R2_5 
  rect(cx+pad*7.3, cy-cwh+delta*4.5+mwh, mwh, mwh);
  
  // min R2_6
  rect(cx+pad*6.4, cy-cwh+delta*5+mwh-7, mwh, mwh);  
  
  // min R2_7
  rect(cx+pad*4.42, cy-cwh+delta*5+mwh+30, mwh, mwh); 

  // min R2_8 
  rect(cx+pad*1.5, cy-cwh+delta*5+mwh + 52, mwh, mwh); 
  
  // min R2_9 
  rect(cx-pad*2.6, cy-cwh+delta*5+mwh + 52, mwh, mwh); 
  
  // min R2_10
  rect(cx-pad*5.5, cy-cwh+delta*5+mwh+30, mwh, mwh);
  
  // min R2_11
  rect(cx-pad*7.5, cy-cwh+delta*5+mwh-7, mwh, mwh);  
  
  // min R2_12 
  rect(cx-pad*8.5, cy-cwh+delta*4.5+mwh, mwh, mwh);
  
  // min R2_13
  rect(cx-pad*8.5, cy-cwh+delta*4+mwh/2, mwh, mwh); 
  
  // min R2_14
  rect(cx-pad*7.5, cy-cwh+delta*3.5+mwh/2+5, mwh, mwh); 
  
  // min R2_15 
  rect(cx-pad*5.5, cy-cwh+delta*3+mwh+8, mwh, mwh); 
  
  
  //R1
  // min R1_0 
  rect(cx-pad*2.4, cy-cwh+delta*2.5+mwh/2-6, mwh, mwh); 
  
  // min R1_1 
  rect(cx+pad*1.2, cy-cwh+delta*2.5+mwh/2-6, mwh, mwh);
  
  // min R1_2 
  rect(cx+pad*4.5, cy-cwh+delta*2.7, mwh, mwh);
  
  // min R1_4
  rect(cx+pad*7, cy-cwh+delta*3, mwh, mwh);
  
  // min R1_5
  rect(cx+pad*8.9, cy-cwh+delta*3.4, mwh, mwh);
  
  // min R1_6
  rect(cx+pad*10, cy-cwh+delta*3.85, mwh, mwh);
  
  // min R1_6
  rect(cx+pad*10.4, cy-cwh+delta*4.35, mwh, mwh);
  
  // min R1_7
  rect(cx+pad*10.4, cy-cwh+delta*4.35, mwh, mwh);
  
  


  
 

  
  //box R1_4 
  rect(cx - off+delta*1.59, cy-cwh+delta*5.15, boxwh, boxwh);
  
  //box R1_5 
  rect(cx - off+delta*0.86, cy-cwh+delta*5.88, boxwh, boxwh);
  
  //box R1_6 (6 o'clock)
  rect(cx - off, cy-cwh+delta*6, boxwh, boxwh);
  
  //box R1_7
  rect(cx -delta*1.07, cy-cwh+delta*5.88, boxwh, boxwh);
  
  //box R1_8
  rect(cx-delta*1.8, cy-cwh+delta*5.15, boxwh, boxwh);
   
  //box R1_9  (9 o'clock)
  rect(cx-delta*1.95, cy-cwh+delta*4.25, boxwh, boxwh); 
  
  // box R1_10
  rect(cx-delta*1.78, cy-cwh+delta*3.4, boxwh, boxwh); 
  
  // box R1_11
  rect(cx -delta*1.08, cy-cwh+delta*2.7, boxwh, boxwh); 
  
  
  
  
  //box R0_0 
  rect(cx - off, cy-cwh+delta*2, boxwh, boxwh);
  
  //box R0_1
  rect(cx - off+delta*0.88, cy-cwh+delta*2.125, boxwh, boxwh);
 
  //box R0_2
  rect(cx - off+delta*1.7, cy-cwh+delta*2.7, boxwh, boxwh); 
  
  //box R0_3 
  rect(cx - off+delta*2.16, cy-cwh+delta*3.4, boxwh, boxwh);
 
 // box R0_4 (3 o'clock) 
  rect(cx - off+delta*2.35, cy-cwh+delta*4.25, boxwh, boxwh);  
  
  //box R0_5
  rect(cx - off+delta*2.17, cy-cwh+delta*5.15, boxwh, boxwh);
  
  //box R0_6
  rect(cx - off+delta*1.7, cy-cwh+delta*5.88, boxwh, boxwh); 
  
  //box R0_7
  rect(cx - off+delta*0.89, cy-cwh+delta*6.45, boxwh, boxwh);
  
  //box R0_8 (6 o'clock)
  rect(cx - off, cy-cwh+delta*6.5, boxwh, boxwh);
  
  //box R0_9
  rect(cx -delta*1.11, cy-cwh+delta*6.45, boxwh, boxwh);
  
  //box R0_10
  rect(cx-delta*1.9, cy-cwh+delta*5.88, boxwh, boxwh);
  
  //box R0_11
  rect(cx-delta*2.4, cy-cwh+delta*5.15, boxwh, boxwh);
  
  // box R0_12 (9 o'clock)
  rect(cx - delta*2.6, cy-cwh+delta*4.25, boxwh, boxwh);  
  
  //box R0_13
  rect(cx-delta*2.39, cy-cwh+delta*3.4, boxwh, boxwh); 
  
  //box R0_14
  rect(cx-delta*1.9, cy-cwh+delta*2.7, boxwh, boxwh); 
  
  //box R0_15
  rect(cx -delta*1.1, cy-cwh+delta*2.125, boxwh, boxwh);
}
