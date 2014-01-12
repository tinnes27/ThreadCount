public class ColorPalette {
  color dark;
  color medium;
  color light;
  
  color dark_hover;
  color medium_hover;
  color light_hover;

  public ColorPalette(color a, color b, color c, color d, color e, color f){
    dark = a;
    dark_hover = b;
    medium = c;
    medium_hover = d;
    light = e;
    light_hover = f;
  }
}

public class ColorGenerator{
  color[] dark = new color[10];
  color[] medium = new color[10];
  color[] light = new color[10];
  color[] dark_hover = new color[10];
  color[] medium_hover = new color[10];
  color[] light_hover = new color[10];
  int index = 0;
  public ColorGenerator(){
    //Yellow
    light_hover[0] = #f8ff80;
    light[0] = #e9e740;
    medium_hover[0] = #dbd000;
    medium[0] = #c0b600;
    dark_hover[0] = #a59c00;
    dark[0] = #8a8300;
    //Orange
    light_hover[1] = #f6bc33;
    light[1] = #e19f0c;
    medium_hover[1] = #aa7a0c;
    medium[1] = #8b6106;
    dark_hover[1] = #684A0B;
    dark[1] = #4E390A;
    
    //Teal
    light_hover[2] = #55f2c7;
    light[2] = #28dfae;
    medium_hover[2] = #11b28b;
    medium[2] = #097b68;
    dark_hover[2] = #02403d;
    dark[2] = #032b29;
    //Light Blue
    light_hover[3] = #5cd1f3;
    light[3] = #30b9e0;
    medium_hover[3] = #1a8fb5;
    medium[3] = #135c80;
    dark_hover[3] = #0c2e47;
    dark[3] = #0d2333;
    //Medium Blue
    light_hover[4] = #92b8d9;
    light[4] = #5995cd;
    medium_hover[4] = #347bbc;
    medium[4] = #205b97;
    dark_hover[4] = #173a6b;
    dark[4] = #0e1d3b;

    //Blue-gray
    light_hover[5] = #bfd2ed;
    light[5] = #94add6;
    medium_hover[5] = #6c8dc0;
    medium[5] = #4a6ca0;
    dark_hover[5] = #3a4e70;
    dark[5] = #243144;
    // Lavender
    light_hover[6] = #c2c5eb;
    light[6] = #989bd3;
    medium_hover[6] = #7176bc;
    medium[6] = #4f549c;
    dark_hover[6] = #3d3f6d;
    dark[6] = #262843;    
    //Purple
    light_hover[7] = #a677d7;
    light[7] = #864fbf;
    medium_hover[7] = #6a23ac;
    medium[7] = #521979;
    dark_hover[7] = #330f43;
    dark[7] = #270f31;
    // Dark Purple
    light_hover[8] = #917fab;
    light[8] = #71549b;
    medium_hover[8] = #59378a;
    medium[8] = #43236c;
    dark_hover[8] = #31174a;
    dark[8] = #1c0a26;    
    //Super Dark Purple
    light_hover[9] = #4b4f88;
    light[9] = #31367c;
    medium_hover[9] = #1b206a;
    medium[9] = #171a46;
    dark_hover[9] = #0c0e29;
    dark[9] = #000121;

    // // Light Orange/Pink
    // light_hover[2] = #f4c6be;
    // light[2] = #e3a796;
    // medium_hover[2] = #d07f6e;
    // medium[2] = #b4624f;
    // dark_hover[2] = #835445;
    // dark[2] = #583a33;
    // // Red
    // light_hover[3] = #e3a09f;
    // light[3] = #d87f76;
    // medium_hover[3] = #cb544f;
    // medium[3] = #b23932;
    // dark_hover[3] = #7f3a31;
    // dark[3] = #542926;
    // //Magenta
    // light_hover[4] = #d69ba4;
    // light[4] = #d18091;
    // medium_hover[4] = #c74062;
    // medium[4] = #b61d4f;
    // dark_hover[4] = #95184b;
    // dark[4] = #771343;
    // // Green
    // light_hover[5] = #7beea6;
    // light[5] = #4cdd82;
    // medium_hover[5] = #29bd60;
    // medium[5] = #248147;
    // dark_hover[5] = #144d29;
    // dark[5] = #003e18;
    // // Lavender
    // light_hover[8] = #c2c5eb;
    // light[8] = #989bd3;
    // medium_hover[8] = #7176bc;
    // medium[8] = #4f549c;
    // dark_hover[8] = #3d3f6d;
    // dark[8] = #262843;
    // //Purple
    // light_hover[9] = #a677d7;
    // light[9] = #864fbf;
    // medium_hover[9] = #6a23ac;
    // medium[9] = #521979;
    // dark_hover[9] = #330f43;
    // dark[9] = #270f31;
  } 
  
  public ColorPalette getColorPalette(){
    ColorPalette newPalette = new ColorPalette(dark[index], dark_hover[index], 
      medium[index], medium_hover[index], light[index], light_hover[index]);
    index++;
    return newPalette;
    
  }
}
