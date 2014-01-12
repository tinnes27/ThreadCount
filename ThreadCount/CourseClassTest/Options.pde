class Option {
  String action;
  float x_offset;
  float y_offset;

  public Option(String action, float x_offset, float y_offset){
    this.action = action;
    this.x_offset = x_offset;
    this.y_offset = y_offset;
  }
  boolean contains(float x, float y){
    if((x >= (x_offset-3))&&(x <= (SIDEBAR_X_OFFSET - 3))&&(y >= y_offset-10)&&(y <= y_offset+7)) {
      return true;
    }
    return false;
  }

  public void draw(){
    if(contains(mouseX, mouseY)){
      fill(50);
    }
    else {
      fill(150);
    }
    textFont(smallBoldText);
    text(action, x_offset, 17);
  }
}

public void drawOptions(float x_offset) {

  clearAll.draw();
}

