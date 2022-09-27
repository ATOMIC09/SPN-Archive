//Disclaimer! Use other editors to read comments for a better experience.

char Player = 'X'; // กำหนดให้ผู้เล่นเริ่มต้นเป็น X (Give X as a start player)
char[][] custom_board = {{'a','b','c'},{'d','e','f'},{'g','h','i'}}; // ตารางเกมอ้างอิง เอาไว้สุ่มตัวอักษรที่ไม่ซ้ำกัน (For reference)
char[][] board = {{' ',' ',' '},{' ',' ',' '},{' ',' ',' '}}; // ตารางเกมหลัก (Create board)
int clicked = 0; // กำหนดตัวแปรเพื่อนับจำนวนครั้งที่คลิก (Click counter)
boolean isEnd = false; // เก็บสถานะว่าเกมจบหรือยังหรือยัง (Check Is game ended?)

void resetArray(){ //สร้างไว้ดึงตัวอักษรจาก Array ของ custom_board ไว้ใน board (Create a board using custom_board as a reference)
    int i = 0;
    int j = 0;
    while (j < 3){ // วนลูปตามคอลัมน์ (Looping in columns)
        while (i < 3){ // วนลูปตามแถว (Looping in rows)
            board[i][j] = custom_board[i][j]; // นำตัวอักษรจาก custom_board ไปใส่ใน board
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    }
    j = 0;
    isEnd = false; // กำหนดว่าเกมยังไม่จบ (Set game ended as not)
} 

void setup(){
    size(800,900); // กำหนดขนาดหน้าต่าง
    background(255); // กำหนดสีพื้นหลัง
    fill(0); // กำหนดสีตัวอักษรเป็นสีดำ
    resetArray(); // เรียกใช้งานฟังก์ชัน resetArray() (Call resetArray() to start new game)
    
    noStroke(); // ไม่ให้มีเส้นขอบ
    fill(255); // กำหนดสีสี่เหลี่ยมเป็นสีขาว
    rect(300,50,230,60); // เอาไว้ถมตัวอักษรเก่า
    fill(0); // กำหนดสีตัวอักษรเป็นสีดำ
    textSize(70); // กำหนดขนาดตัวอักษรที่ 70
    text("Turn : ",275,100); // บอกว่ารอบของใคร 
    text(Player,470,100); // บอกว่าใครเป็นผู้เล่นในรอบนั้น
    stroke(1); // หลังใช้ noStroke() แล้วก็คืนค่ากลับ (ไม่งั้นจะมองไม่เห็นเส้นที่วาด)

    // วาดเส้นตาราง (Draw grid)
    line(100,400,700,400);
    line(100,600,700,600);
    line(300,200,300,800);
    line(500,200,500,800);
}

void draw(){
    // เขียนชื่อคนทำ (Credit)
    textSize(18);
    text("Made by Phutawan Chanrueng",10,890);
}

// Mouse
void mousePressed(){
    if (isEnd == false){ // ถ้าเกมยังไม่จบ (If game not end yet)

        // เขียนบอกว่าเป็นรอบของใคร (แบบเดียวกับใน void setup()) (Same as void setup())
        noStroke();
        fill(255);
        rect(300,50,230,60);
        fill(0);

        flipFlop(); // สลับเป็นผู้เล่นอีกคนเพื่อแสดงว่าเป็นรอบต่อไป (Show next turn)
        textSize(70);
        text("Turn : ",275,100);
        text(Player,470,100);
        stroke(1);
        flipFlop(); // หลังแสดงแล้ว สลับกลับ

        // ตรวจสอบตำแหน่งของเมาส์ว่าอยู่ช่องไหนของตาราง (Find the mouse in which channel)
        if (mouseX>100 && mouseX<300 && mouseY>200 && mouseY<400){ // ช่อง 1
            drawSelection(200,300); // เรียกฟังก์ชันกำหนดตำแหน่งของเครื่องหมายที่จะถูกวาดไปที่ตำแหน่ง 200,300
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

        flipFlop(); // สลับรอบของผู้เล่น (Switch player)

        checkClicked(); // ตรวจสอบว่าเล่นไปแล้วกี่ช่อง
        if (clicked == 9){ // ถ้าใช้แล้ว 9 ช่อง (ครบทุกช่อง) (If game end without any player winning)
            printDraw(); // เรียกฟังก์ชันไว้บอกผู้เล่นว่ารอบนั้นได้เสมอกัน
            isEnd = true; // กำหนดว่าเกมจบแล้ว
        }
    }
    else{ // ถ้าเกมจบแล้ว (If game is over)
        textSize(40); // กำหนดขนาดตัวอักษรที่ 40
        fill(255,0,0); // กำหนดสีตัวอักษรให้เป็นสีแดง
        text("Press R to reset",275,510);
        fill(0); // คืนค่าสีกลับเป็นสีดำเหมือนเดิม
    }
    
}

void flipFlop(){ // สลับรอบของผู้เล่น
    if (Player == 'X'){ // ถ้าเป็น X
        Player = 'O'; // เปลี่ยนเป็น O
    }
    else{ // ถ้าเป็น O
        Player = 'X'; // เปลี่ยนเป็น X
    }
}

// Drawing
void drawSelection(int posX, int posY){ // ฟังก์ชันไว้เลือกว่าจะวาดอะไร (Select X or Y to draw)
    int i = 0;
    int j = 0;
    
    // ให้เงื่อนไขตำแหน่ง เป็นไปตาม Array 2 มิติ  (Set value to a 2D array with reference to posX, posY)
    if (posX == 200){ // ถ้าตำแหน่งที่เครื่องหมายจะถูกวาดเป็นตำแหน่ง X=200
        i = 0; //  i เป็น 0
    }
    if (posX == 400){
        i = 1;
    }
    if (posX == 600){
        i = 2;
    }
    if (posY == 300){ // ถ้าตำแหน่งที่เครื่องหมายจะถูกวาดเป็นตำแหน่ง Y=300
        j = 0; // j เป็น 0
    }
    if (posY == 500){
        j = 1;
    }
    if (posY == 700){
        j = 2;
    }

    if (Player == 'X'){ // ถ้าผู้เล่นคือ X (If player is X, draw X)
        drawX(posX,posY); // วาด X ที่ตำแหน่ง (posX,posY)
        board[i][j] = 'X';  // กำหนด Array ในตำแหน่ง [i][j] ตามตำแหน่ง posX,posY ตามที่กำหนดไว้ของเงื่อนไขด้านบน
    }
    else{
        drawO(posX,posY);
        board[i][j] = 'O'; 
    }
    checkWin(); // หลังถูกสั่งให้วาด ก็ตรวจว่ามีผู้ชนะหรือยัง (Check if someone has won or not)
}

void drawX(int posX, int posY){ // วาด X ตามตำแหน่ง posX,posY
    fill(0);
    line(posX-50,posY-50,posX+50,posY+50);
    line(posX-50,posY+50,posX+50,posY-50);
}

void drawO(int posX, int posY){ // วาด O ตามตำแหน่ง posX,posY
    fill(0);
    noFill();
    ellipse(posX,posY,100,100);
}

void checkWin(){ // ตรวจสอบว่ามีผู้ชนะหรือไม่ โดยใช้ Array เป็นตัวอ้างอิงตำแหน่ง (Check if someone wins by referring to an array.)
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

void printWinner(){ // แสดงข้อความว่าใครชนะ
    background(117,255,124); // สีพื้นหลังสีเขียว
    textSize(70);
    text(Player,320,450); // แสดงผลผู้เล่นในรอบนั้น
    text("win",385,450);
    isEnd = true; // กำหนดว่าเกมจบแล้ว
}

void printDraw(){ // แสดงข้อความว่าได้เสมอกัน
    background(200); // สีพื้นหลังสีเทา
    textSize(70);
    text("Draw",330,450);
}

void checkClicked(){ // เช็คว่าเล่นไปแล้วกี่ช่อง (Count how many channels have been used)
    int i = 0;
    int j = 0;
    clicked = 0; // กำหนดให้เป็น 0 ทุกครั้งที่เรียก (ไม่งั้นค่ามันจะบวกกันไปเรื่อย ๆ) (Set zero)
    while (j < 3){
        while (i < 3){
            if (board[i][j] == 'X' || board[i][j] == 'O'){ // ตรวจว่าในแต่ละช่องมี X หรือ O หรือไม่ (เพราะตอนแรกจะใส่เป็น a,b,c,d,e,f,g,h,i เพื่อให้แต่ละช่องไม่ซ้ำกันเลย)
                clicked = clicked + 1;
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    }
    j = 0;
}

void keyPressed(){
    // Debug Mode
    // Click C to count XO in array
    if (keyCode == 'C'){
        checkClicked();
        fill(255);
        noStroke();
        rect(0,0,60,60);
        fill(255,0,0);
        textSize(40);
        text(clicked,20,40);
    }

    // Click R to reset game
    if (keyCode == 'R'){
        background(255);
        setup();
        resetArray();
    }
}