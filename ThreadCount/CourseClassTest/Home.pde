void drawHome(){
  fill(255, 255, 255);
  rect(0,0,WIDTH, HEIGHT);
  float space = 10;
  float w = 20;
  //Draw Threads
  drawThread(20, #097b68);
  drawThread(50, #135c80);
  drawThread(80, #205b97);
  drawThread(110, #4a6ca0);
  drawThread(HEIGHT - 20 - 20, #4f549c);
  drawThread(HEIGHT - 20 - 50, #521979);
  drawThread(HEIGHT - 20 - 80, #43236c);
  drawThread(HEIGHT - 20 - 110, #171a46);
  drawCore1(20,#c0b600);
  drawCore2(50, #8b6106);
  drawCore1(80, #c0b600);
  drawCore1(WIDTH -40,#c0b600);
  drawCore2(WIDTH -70,#8b6106);
  drawCore1(WIDTH -100,#c0b600);
  fill(0);
  textFont(regText);
  text("Click to Enter", WIDTH/2 - textWidth("Click to Enter")/2, HEIGHT/2);
  text("Created by Kevin Guebert, Tim Innes, Roberta Reusch-Lewis, and Stephanie Yawn", 110, HEIGHT -5);
  textFont(giantText);
  text("Thread Count", WIDTH/2 - textWidth("Thread Count")/2, HEIGHT/2-50);
}

void drawThread(float y, color c){
    fill(c);
    rect(0,y,WIDTH, 20);
  
}

void drawCore1(float x, color c){
  fill(c);
  rect(x, 0, 20, 20);
  rect(x, 40, 20, 40);
  rect(x, 100, 20, 470);
  rect(x, 590, 20, 40);
  rect(x, 650, 20, 50);
}

void drawCore2(float x, color c){
  fill(c);
  rect(x,0, 20, 50);
  rect(x,70, 20, 40);
  rect(x, 130, 20, 470);
  rect(x, 620, 20, 40);
  rect(x, 680, 20, 40);
}

void drawEnter(){
  
}

void drawThreadPicks(){
  
}
