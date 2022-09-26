char Player = 'X';
char[][] board = {{'a','b','c'},{'d','e','f'},{'g','h','i'}};
int clicked = 0;

void setup(){
    size(800,900);
    background(255);
    fill(0);
    // Draw Grid
    line(100,400,700,400);
    line(100,600,700,600);
    line(300,200,300,800);
    line(500,200,500,800);
}

void draw(){
    noStroke();
    fill(255);
    rect(300,50,230,60);
    fill(0);
    textSize(70);
    text("Turn : ",275,100);
    text(Player,470,100);
    stroke(1);

    textSize(18);
    text("Made by Phutawan Chanrueng",10,890);
}
// Drawing
void drawSelection(int posX, int posY){
    int i = 0;
    int j = 0;
    // Set Player to 2D Array
    if (posX == 200){
        i = 0;
    }
    if (posX == 400){
        i = 1;
    }
    if (posX == 600){
        i = 2;
    }
    if (posY == 300){
        j = 0;
    }
    if (posY == 500){
        j = 1;
    }
    if (posY == 700){
        j = 2;
    }

    if (Player == 'X'){
        drawX(posX,posY);
        board[i][j] = 'X'; 
    }
    else{
        drawO(posX,posY);
        board[i][j] = 'O'; 
    }
    checkWin();
}

void drawX(int posX, int posY){
    fill(0);
    line(posX-50,posY-50,posX+50,posY+50);
    line(posX-50,posY+50,posX+50,posY-50);
}

void drawO(int posX, int posY){
    fill(0);
    noFill();
    ellipse(posX,posY,100,100);
}

// Mouse
void mousePressed(){
    if (mouseX>100 && mouseX<300 && mouseY>200 && mouseY<400){
        drawSelection(200,300);
    }
    if (mouseX>300 && mouseX<500 && mouseY>200 && mouseY<400){
        drawSelection(400,300);
    }
    if (mouseX>500 && mouseX<700 && mouseY>200 && mouseY<400){
        drawSelection(600,300);
    }
    if (mouseX>100 && mouseX<300 && mouseY>400 && mouseY<600){
        drawSelection(200,500);
    }
    if (mouseX>300 && mouseX<500 && mouseY>400 && mouseY<600){
        drawSelection(400,500);
    }
    if (mouseX>500 && mouseX<700 && mouseY>400 && mouseY<600){
        drawSelection(600,500);
    }
    if (mouseX>100 && mouseX<300 && mouseY>600 && mouseY<800){
        drawSelection(200,700);
    }
    if (mouseX>300 && mouseX<500 && mouseY>600 && mouseY<800){
        drawSelection(400,700);
    }
    if (mouseX>500 && mouseX<700 && mouseY>600 && mouseY<800){
        drawSelection(600,700);
    }

    if (Player == 'X'){
        Player = 'O';
    }
    else{
        Player = 'X';
    }
}

// Check Is Win
void checkWin(){
    // แนวนอน
    if (board[0][0] == board[0][1] && board[0][0] == board[0][2]){
        printWinner();
    }
    if (board[1][0] == board[1][1] && board[1][0] == board[1][2]){
        printWinner();
    }
    if (board[2][0] == board[2][1] && board[2][0] == board[2][2]){
        printWinner();
    }
    
    // แนวตั้ง
    if (board[2][0] == board[1][0] && board[2][0] == board[2][0]){
        printWinner();
    }
    if (board[0][1] == board[1][1] && board[0][1] == board[2][1]){
        printWinner();
    }
    if (board[0][2] == board[1][2] && board[0][2] == board[2][2]){
        printWinner();
    }
    
    // แนวทแยง
    if (board[0][0] == board[1][1] && board[0][0] == board[2][2]){
        printWinner();
    }
    if (board[0][2] == board[1][1] && board[0][2] == board[2][0]){
        printWinner();
    }
    
}

void printWinner(){
    background(255);
    textSize(70);
    text(Player,310,450);
    text("wins",380,450);
}

void checkClicked(){
    int i = 0;
    int j = 0;
    while (j < 3){
        while (i < 3){
            if (board[i][j] == 'X' || board[i][j] == 'O'){
                clicked = clicked + 1;
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    }
    j = 0;
}

// Debug Mode
void keyPressed(){
    // Click C to check counter in 'board' array
    if (keyCode == 'C'){
        checkClicked();
        fill(255);
        noStroke();
        rect(0,0,200,90);
        fill(255,0,0);
        textSize(40);
        text(clicked,20,40);
        clicked = 0;
    }
}
