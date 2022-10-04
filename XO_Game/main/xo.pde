//Disclaimer! Use other editors to read comments for a better experience.
PrintWriter output;

char Player = 'X'; // กำหนดให้ผู้เล่นเริ่มต้นเป็น X (Give X as a start player)
char[][] custom_board = {{'a','b','c'},{'d','e','f'},{'g','h','i'}}; // ตารางเกมอ้างอิง เอาไว้สุ่มตัวอักษรที่ไม่ซ้ำกัน (For reference)
char[][] board = {{' ',' ',' '},{' ',' ',' '},{' ',' ',' '}}; // ตารางเกมหลัก (Create board)
int clicked = 0; // กำหนดตัวแปรเพื่อนับจำนวนครั้งที่คลิก (Click counter)
boolean isEnd = false; // เก็บสถานะว่าเกมจบหรือยังหรือยัง (Check Is game ended?)
int speedX = 1;
int speedO = 1;
int clickX = 0;
int posX_ANIMATE_X = 0;
int posY_ANIMATE_X = 0;

int posX_ANIMATE_O = 0;
int posY_ANIMATE_O = 0;

boolean isLoading = false;

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
    frameRate(60);
    size(800,900); // กำหนดขนาดหน้าต่าง (Set window size)
    background(255); // กำหนดสีพื้นหลัง (Set background color)
    fill(0); // กำหนดสีตัวอักษรเป็นสีดำ (Set text color as black)
    resetArray(); // เรียกใช้งานฟังก์ชัน resetArray() (Call resetArray() to start new game)
    
    noStroke(); // ไม่ให้มีเส้นขอบ (No stroke)
    fill(255); // กำหนดสีสี่เหลี่ยมเป็นสีขาว (Set rectangle color as white)
    rect(300,50,230,60); // เอาไว้ถมตัวอักษรเก่า (For hide old text)
    fill(0); // กำหนดสีตัวอักษรเป็นสีดำ (Set text color as black)
    textSize(70); // กำหนดขนาดตัวอักษรที่ 70 (Set text size as 70)
    text("Turn : ",275,100); // บอกว่ารอบของใคร (Show who's turn)
    text(Player,470,100); // บอกว่าใครเป็นผู้เล่นในรอบนั้น (Show who's player)
    stroke(10); // หลังใช้ noStroke() แล้วก็คืนค่ากลับ (ไม่งั้นจะมองไม่เห็นเส้นที่วาด) (Return stroke value)
    strokeWeight(7);
    drawGrid(); // เรียกใช้งานฟังก์ชัน drawLine() (Call drawLine() to draw lines)
}

void drawGrid(){
    // วาดเส้นตาราง (Draw grid)
    line(100,400,700,400);
    line(100,600,700,600);
    line(300,200,300,800);
    line(500,200,500,800);
}
void draw(){
    // เขียนชื่อคนทำ (Credit)
    textSize(18); // (Set text size as 18)
    text("R - Reset | S - Save game | L - Load game",10,890);

    if (isEnd == false){
        if (Player == 'O'){ // ถ้าเป็นรอบของ X (If it's X's turn)
            if (clickX == 1){
                drawX();
                speedX = speedX + 5;
            }
        }
        else{
            if (clickX == 1){
                drawO();
                speedO = speedO + 10;
            }
        }
    }
    else{
        clickX = 0;
    }

    if (speedX > 50){
        speedX = 1;
        clickX = 0;
    }
    if (speedO > 100){
        speedO = 1;
        clickX = 0;
    }
}

void checkHint(){
    printBoard();
    // แนวนอน
    if (board[0][0] == board[1][0]){
        showHint();
    }
    if (board[1][0] == board[2][0]){
        showHint();
    }
    if (board[0][1] == board[1][1]){
        showHint();
    }
    if (board[1][1] == board[2][1]){
        showHint();
    }
    if (board[0][2] == board[1][2]){
        showHint();
    }
    if (board[1][2] == board[2][2]){
        showHint();
    }
    // แนวตั้ง
    if (board[0][0] == board[0][1]){
        showHint();
    }
    if (board[0][1] == board[0][2]){
        showHint();
    }
    if (board[1][0] == board[1][1]){
        showHint();
    }
    if (board[1][1] == board[1][2]){
        showHint();
    }
    if (board[2][0] == board[2][1]){
        showHint();
    }
    if (board[2][1] == board[2][2]){
        showHint();
    }
    // แนวทะแยง
    if (board[0][0] == board[1][1]){
        showHint();
    }
    if (board[1][1] == board[2][2]){
        showHint();
    }
    if (board[0][2] == board[1][1]){
        showHint();
    }
    if (board[1][1] == board[2][0]){
        showHint();
    }
}

void showHint(){
    noStroke();
    fill(255);
    rect(180,810,450,815);
    stroke(10);
    textSize(40); // กำหนดขนาดตัวอักษรที่ 40 (Set text size to 40)
    fill(255,0,0); // กำหนดสีตัวอักษรให้เป็นสีแดง (Set text color to red)
    String printthis = "Hint : " + Player + " is close to winning";
    text(printthis,190,850);
    fill(0); // คืนค่าสีกลับเป็นสีดำเหมือนเดิม (Set color back to black)
}

// Mouse
void mousePressed(){
    if (isEnd == false){ // ถ้าเกมยังไม่จบ (If game not end yet)
        // ตรวจสอบตำแหน่งของเมาส์ว่าอยู่ช่องไหนของตาราง (Find the mouse in which channel)
        if (mouseX>100 && mouseX<300 && mouseY>200 && mouseY<400){ // ช่อง 1
            drawSelection(200,300); // เรียกฟังก์ชันกำหนดตำแหน่งของเครื่องหมายที่จะถูกวาดไปที่ตำแหน่ง 200,300 (Call drawSelection() to draw X or O at 200,300)
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

        checkClicked(); // ตรวจสอบว่าเล่นไปแล้วกี่ช่อง (Check how many channel has been clicked)
        if (clicked == 9){ // ถ้าใช้แล้ว 9 ช่อง (ครบทุกช่อง) (If game end without any player winning)
            printDraw(); // เรียกฟังก์ชันไว้บอกผู้เล่นว่ารอบนั้นได้เสมอกัน (Call printDraw() to show that the game is draw)
            isEnd = true; // กำหนดว่าเกมจบแล้ว (Set game end)
        }
    }
    else{ // ถ้าเกมจบแล้ว (If game is over)
        textSize(40); // กำหนดขนาดตัวอักษรที่ 40 (Set text size to 40)
        fill(255,0,0); // กำหนดสีตัวอักษรให้เป็นสีแดง (Set text color to red)
        text("Press R to reset",275,510); //(Show text to press R to reset)
        fill(0); // คืนค่าสีกลับเป็นสีดำเหมือนเดิม (Set color back to black)
    }
    
}

void flipFlop(){ // สลับรอบของผู้เล่น (Change turn)
    if (Player == 'X'){ // ถ้าเป็น X (If player is X)
        Player = 'O'; // เปลี่ยนเป็น O (Change to O)
    }
    else{ // ถ้าเป็น O (If player is O)
        Player = 'X'; // เปลี่ยนเป็น X (Change to X)
    }
}

// Drawing
void drawSelection(int posX, int posY){ // ฟังก์ชันไว้เลือกว่าจะวาดอะไร (Select X or Y to draw)
    clickX = 1;

    // เขียนบอกว่าเป็นรอบของใคร (แบบเดียวกับใน void setup()) (Show who's turn. Same as void setup())
    noStroke();
    fill(255);
    rect(300,50,230,60);
    fill(0);

    flipFlop(); // สลับเป็นผู้เล่นอีกคนเพื่อแสดงว่าเป็นรอบต่อไป (Show next turn)
    textSize(70);
    text("Turn : ",275,100); // บอกว่ารอบของใคร (Show who's turn)
    text(Player,470,100); // บอกว่าใครเป็นผู้เล่นในรอบนั้น (Show who's player)
    stroke(10);
    flipFlop(); // หลังแสดงแล้ว เปลี่ยนกลับเป็นผู้เล่นเดิม (Change back to previous player)
    
    int i = 0;
    int j = 0;
    
    // ให้เงื่อนไขตำแหน่ง เป็นไปตาม Array 2 มิติ  (Set value to a 2D array with reference to posX, posY)
    if (posX == 200){ // ถ้าตำแหน่งที่เครื่องหมายจะถูกวาดเป็นตำแหน่ง X=200 (If position X is 200)
        i = 0; //  i เป็น 0 (Set i = 0)
    }
    if (posX == 400){
        i = 1;
    }
    if (posX == 600){
        i = 2;
    }
    if (posY == 300){ // ถ้าตำแหน่งที่เครื่องหมายจะถูกวาดเป็นตำแหน่ง Y=300 (If position Y is 300)
        j = 0; // j เป็น 0 (Set j = 0)
    }
    if (posY == 500){
        j = 1;
    }
    if (posY == 700){
        j = 2;
    }

    if (Player == 'X'){ // ถ้าผู้เล่นคือ X (If player is X)
        posX_ANIMATE_X = posX;
        posY_ANIMATE_X = posY; // วาด X ที่ตำแหน่ง (posX,posY) (Draw X at position (posX,posY))
        board[i][j] = 'X';  // กำหนด Array ในตำแหน่ง [i][j] ตามตำแหน่ง posX,posY ตามที่กำหนดไว้ของเงื่อนไขด้านบน (Set array at position [i][j] with reference to posX,posY)
    }
    else{
        posX_ANIMATE_O = posX;
        posY_ANIMATE_O = posY; // วาด O ที่ตำแหน่ง (posX,posY) (Draw O at position (posX,posY))
        board[i][j] = 'O'; 
    }
    // กลบข้อความมุมขวาล่าง
    fill(255);
    noStroke();
    rect(690,850,800,900);
    fill(0);
    stroke(10);
    
    checkHint();
    checkWin(); // หลังถูกสั่งให้วาด ก็ตรวจว่ามีผู้ชนะหรือยัง (After drawing, check if there is a winner)
    flipFlop(); // สลับรอบของผู้เล่น (Change turn) 

    
}

void saveText(){ // เช็คว่าเล่นไปแล้วกี่ช่อง (Count how many channels have been used)
    int i = 0;
    int j = 0;
    println("File Saved");
    while (j < 3){
        while (i < 3){
            output.print(board[i][j]);
            print(board[i][j]);
            
            if (i < 2){
                output.print(",");
                print(",");
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    if (j < 3){
        output.print(",");
        print(",");
    }
    }
    j = 0;
    output.print("," + Player);
    println();
}

void printFileLoaded(){ 
    int i = 0;
    int j = 0;
    println("File Loaded");
    while (j < 3){
        while (i < 3){
            print(board[i][j]);
            if (i < 2){
                print(",");
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    if (j < 3){
        print(",");
    }
    }
    j = 0;
    println();
}

void drawX(){ // วาด X ตามตำแหน่ง posX,posY (Draw X at position posX,posY)
    fill(0);
    stroke(0);
    line(posX_ANIMATE_X-speedX,posY_ANIMATE_X-speedX,posX_ANIMATE_X+speedX,posY_ANIMATE_X+speedX);
    line(posX_ANIMATE_X-speedX,posY_ANIMATE_X+speedX,posX_ANIMATE_X+speedX,posY_ANIMATE_X-speedX);
}

void drawO(){ // วาด O ตามตำแหน่ง posX,posY (Draw O at position posX,posY)
    fill(255);
    circle(posX_ANIMATE_O,posY_ANIMATE_O,speedO);
    fill(0);
}

void drawLoadGame(){
    int i = 0;
    int j = 0;
    int posX = 0;
    int posY = 0;

   
    while (j < 3){
        while (i < 3){
            if (i == 0){
                posX = 200; 
            }
            if (i == 1){
                posX = 400;
            }
            if (i == 2){
                posX = 600;
            }
            if (j == 0){ 
                posY = 300;
            }
            if (j == 1){
                posY = 500;
            }
            if (j == 2){
                posY = 700;
            }

            if (board[i][j] == 'X'){
                posX_ANIMATE_X = posX;
                posY_ANIMATE_X = posY; // วาด X ที่ตำแหน่ง (posX,posY) (Draw X at position (posX,posY))
                speedX = 50;
                drawX();
                
                
            }
            if (board[i][j] == 'O'){
                posX_ANIMATE_O = posX;
                posY_ANIMATE_O = posY; // วาด O ที่ตำแหน่ง (posX,posY) (Draw O at position (posX,posY))
                speedO = 100;
                drawO();
                
            }
            isLoading = true;
            
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    }
    j = 0;
}
void checkWin(){ // ตรวจสอบว่ามีผู้ชนะหรือไม่ โดยใช้ Array เป็นตัวอ้างอิงตำแหน่ง (Check if someone wins by referring to an array.)
    // แนวนอน (Horizontal)
    if (board[0][0] == board[1][0] && board[1][0] == board[2][0]){
        printWinner();
    }
    if (board[0][1] == board[1][1] && board[1][1] == board[2][1]){
        printWinner();
    }
    if (board[0][2] == board[1][2] && board[1][2] == board[2][2]){
        printWinner();
    }

    // แนวตั้ง (Vertical)
    if (board[0][0] == board[0][1] && board[0][1] == board[0][2]){
        printWinner();
    }
    if (board[1][0] == board[1][1] && board[1][1] == board[1][2]){
        printWinner();
    }
    if (board[2][0] == board[2][1] && board[2][1] == board[2][2]){
        printWinner();
    }

    // แนวทแยง (Diagonal)
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2]){
        printWinner();
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0]){
        printWinner();
    }
}

void printWinner(){ // แสดงข้อความว่าใครชนะ (Show who wins)
    background(117,255,124); // สีพื้นหลังสีเขียว (Background color is green)
    textSize(70);
    text(Player,320,450); // แสดงผลผู้เล่นในรอบนั้น (Show player in this round)
    text("win",385,450);
    isEnd = true; // กำหนดว่าเกมจบแล้ว (Set that the game is over)
}

void printDraw(){ // แสดงข้อความว่าได้เสมอกัน
    background(200); // สีพื้นหลังสีเทา
    textSize(70);
    text("Draw",330,450); // แสดงผลว่าเสมอ (Show that it is a draw)
}

void checkClicked(){ // เช็คว่าเล่นไปแล้วกี่ช่อง (Count how many channels have been used)
    int i = 0;
    int j = 0;
    clicked = 0; // กำหนดให้เป็น 0 ทุกครั้งที่เรียก (ไม่งั้นค่ามันจะบวกกันไปเรื่อย ๆ) (Set zero every time it is called (otherwise the value will be added))
    while (j < 3){
        while (i < 3){
            if (board[i][j] == 'X' || board[i][j] == 'O'){ // ตรวจว่าในแต่ละช่องมี X หรือ O หรือไม่ (เพราะตอนแรกจะใส่เป็น a,b,c,d,e,f,g,h,i เพื่อให้แต่ละช่องไม่ซ้ำกันเลย) (Check if there is X or O in each cell (because at first it will be a, b, c, d, e, f, g, h, i so that each cell is not the same))
                clicked = clicked + 1;
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;
    }
    j = 0;
}

void printBoard(){
    int i = 0;
    int j = 0;
    println();
    while (j < 3){
        while (i < 3){
            print("[",i,"]","[",j,"]",board[i][j]);
            
            if (i < 2){
                print("   |   ");
            }
            i = i + 1;
        }
        i = 0;
        j = j + 1;

    println();
    }
    j = 0;
    println();
}

void keyPressed(){
    // กลบข้อความมุมขวาล่าง (อันเก่า)
    fill(255);
    noStroke();
    rect(690,850,800,900);
    fill(0);
    stroke(10);

    // Debug Mode
    // Click C to count XO in array
    if (keyCode == 'C'){
        checkClicked(); // เรียกใช้งานฟังก์ชัน checkClicked() (Call the checkClicked () function)
        fill(255);
        noStroke();
        rect(0,0,60,60);
        fill(255,0,0);
        textSize(40);
        text(clicked,20,40);
        printBoard();
    }

    // Click R to reset game
    if (keyCode == 'R'){
        setup(); // เรียกใช้งานฟังก์ชัน setup() (Call the setup () function)
        resetArray(); // เรียกใช้งานฟังก์ชัน resetArray() (Call the resetArray () function)
        
        Player = 'X';
        // เขียนบอกว่าเป็นรอบของใคร (แบบเดียวกับใน void setup()) (Show who's turn. Same as void setup())
        noStroke();
        fill(255);
        rect(300,50,230,60);
        fill(0);

        textSize(70);
        text("Turn : ",275,100); // บอกว่ารอบของใคร (Show who's turn)
        text(Player,470,100); // บอกว่าใครเป็นผู้เล่นในรอบนั้น (Show who's player)

        fill(255,55,58);
        textSize(30); // (Set text size as 30)
        text("Reset",720,890);
        fill(0);
    }

    // Click S to save game
    if (keyCode == 'S'){
        output = createWriter("save.txt");
        saveText(); // บันทึกเกม (Save game)
        output.flush();  // Writes the remaining data to the file
        output.close();  // Finishes the file
        //exit();  // Stops the program

        fill(60,232,65);
        textSize(30); // (Set text size as 30)
        text("Saved",710,890);
        fill(0);
    }

    // Click L to load game
    if (keyCode == 'L'){
        BufferedReader reader = createReader("save.txt");
        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                String[] pieces = split(line, ",");
                board[0][0] = pieces[0].charAt(0);
                board[1][0] = pieces[1].charAt(0);
                board[2][0] = pieces[2].charAt(0);
                board[0][1] = pieces[3].charAt(0);
                board[1][1] = pieces[4].charAt(0);
                board[2][1] = pieces[5].charAt(0);
                board[0][2] = pieces[6].charAt(0);
                board[1][2] = pieces[7].charAt(0);
                board[2][2] = pieces[8].charAt(0);
                Player = pieces[9].charAt(0);
            }
            reader.close();

            background(255);
            drawGrid();
            isEnd = false;
            printFileLoaded();
            drawLoadGame();

            fill(255,147,58);
            textSize(30); // (Set text size as 30)
            text("Loaded",700,890);
            fill(0);

            // เขียนบอกว่าเป็นรอบของใคร (แบบเดียวกับใน void setup()) (Show who's turn. Same as void setup())
            noStroke();
            fill(255);
            rect(300,50,230,60);
            fill(0);

            textSize(70);
            text("Turn : ",275,100); // บอกว่ารอบของใคร (Show who's turn)
            text(Player,470,100); // บอกว่าใครเป็นผู้เล่นในรอบนั้น (Show who's player)
        
        }

        catch (IOException e) {
            e.printStackTrace();
        }
    } 
}
