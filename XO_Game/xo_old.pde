int turn = 1 ; // 0 -> O | 1 -> X
int[][] x_click = new int[4][4];
int[][] o_click = new int[4][4];

void setup(){
  size(800,900);
  background(255);
  line(100,400,700,400);
  line(100,600,700,600);
  line(300,200,300,800);
  line(500,200,500,800);
}

void draw(){
  text("",0,0);
}

// Drawing
void drawX(int posX,int posY){
  line(posX-50,posY-50,posX+50,posY+50);
  line(posX-50,posY+50,posX+50,posY-50);
  noStroke();
  fill(255);
  rect(300,50,230,60);
  fill(0);
  textSize(70);
  text("Turn : X",300,100);
}

void drawO(int posX,int posY){
  noFill();
  ellipse(posX,posY,100,100);
  noStroke();
  fill(255);
  rect(300,50,230,60);
  fill(0);
  textSize(70);
  text("Turn : O",300,100);
}

void mousePressed(){
  stroke(1);
  if (turn == 1){
    if (mouseX>100 && mouseX<300 && mouseY>200 && mouseY<400){
      drawX(200,300);
      x_click[1][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>200 && mouseY<400){
      drawX(400,300);
      x_click[1][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>200 && mouseY<400){
      drawX(600,300);
      x_click[1][3] = 1;
    }
    if (mouseX>100 && mouseX<300 && mouseY>400 && mouseY<600){
      drawX(200,500);
      x_click[2][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>400 && mouseY<600){
      drawX(400,500);
      x_click[2][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>400 && mouseY<600){
      drawX(600,500);
      x_click[2][3] = 1;
    }
    if (mouseX>100 && mouseX<300 && mouseY>600 && mouseY<800){
      drawX(200,700);
      x_click[3][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>600 && mouseY<800){
      drawX(400,700);
      x_click[3][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>600 && mouseY<800){
      drawX(600,700);
      x_click[3][3] = 1;
    }
    turn = 0;
    check_positionX();
  }

  else {
    if (mouseX>100 && mouseX<300 && mouseY>200 && mouseY<400){
      drawO(200,300);
      o_click[1][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>200 && mouseY<400){
      drawO(400,300);
      o_click[1][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>200 && mouseY<400){
      drawO(600,300);
      o_click[1][3] = 1;
    }
    if (mouseX>100 && mouseX<300 && mouseY>400 && mouseY<600){
      drawO(200,500);
      o_click[2][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>400 && mouseY<600){
      drawO(400,500);
      o_click[2][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>400 && mouseY<600){
      drawO(600,500);
      o_click[2][3] = 1;
    }
    if (mouseX>100 && mouseX<300 && mouseY>600 && mouseY<800){
      drawO(200,700);
      o_click[3][1] = 1;
    }
    if (mouseX>300 && mouseX<500 && mouseY>600 && mouseY<800){
      drawO(400,700);
      o_click[3][2] = 1;
    }
    if (mouseX>500 && mouseX<700 && mouseY>600 && mouseY<800){
      drawO(600,700);
      o_click[3][3] = 1;
    }
    turn = 1;
    check_positionO();
  }
}




// Checking X
void check_positionX(){
  // แนวตั้ง
  if (x_click[1][1] == 1 && x_click[1][2] == 1 && x_click[1][3] == 1){
    background(255);
    text("X wins",330,450);
  }
  if (x_click[2][1] == 1 && x_click[2][2] == 1 && x_click[2][3] == 1){
    background(255);
    text("X wins",330,450);
  }
  if (x_click[3][1] == 1 && x_click[3][2] == 1 && x_click[3][3] == 1){
    background(255);
    text("X wins",330,450);
  }

  //แนวนอน
  if (x_click[1][1] == 1 && x_click[2][1] == 1 && x_click[3][1] == 1){
    background(255);
    text("X wins",330,450);
  }
  if (x_click[1][2] == 1 && x_click[2][2] == 1 && x_click[3][2] == 1){
    background(255);
    text("X wins",330,450);
  }
  if (x_click[1][3] == 1 && x_click[2][3] == 1 && x_click[3][3] == 1){
    background(255);
    text("X wins",330,450);
  }

  //แนวทะแยง
  if (x_click[1][1] == 1 && x_click[2][2] == 1 && x_click[3][3] == 1){
    background(255);
    text("X wins",330,450);
  }
  if (x_click[1][3] == 1 && x_click[2][2] == 1 && x_click[3][1] == 1){
    background(255);
    text("X wins",330,450);
  }
}

// Checking O
void check_positionO(){
  // แนวตั้ง
  if (o_click[1][1] == 1 && o_click[1][2] == 1 && o_click[1][3] == 1){
    background(255);
    text("O wins",310,450);
  }
  if (o_click[2][1] == 1 && o_click[2][2] == 1 && o_click[2][3] == 1){
    background(255);
    text("O wins",310,450);
  }
  if (o_click[3][1] == 1 && o_click[3][2] == 1 && o_click[3][3] == 1){
    background(255);
    text("O wins",310,450);
  }

  //แนวนอน
  if (o_click[1][1] == 1 && o_click[2][1] == 1 && o_click[3][1] == 1){
    background(255);
    text("O wins",310,450);
  }
  if (o_click[1][2] == 1 && o_click[2][2] == 1 && o_click[3][2] == 1){
    background(255);
    text("O wins",310,450);
  }
  if (o_click[1][3] == 1 && o_click[2][3] == 1 && o_click[3][3] == 1){
    background(255);
    text("O wins",310,450);
  }

  //แนวทะแยง
  if (o_click[1][1] == 1 && o_click[2][2] == 1 && o_click[3][3] == 1){
    background(255);
    text("O wins",310,450);
  }
  if (o_click[1][3] == 1 && o_click[2][2] == 1 && o_click[3][1] == 1){
    background(255);
    text("O wins",310,450);
  }
}