int size = 500; //ตัวแปรสำหรับเก็บขนาดวงแหวน
int win = 0; //ตัวแปรสำหรับเก็บว่าชนะหรือไม่
int click = 0; //ตัวแปรที่เช็คว่าคลิ๊กไปแล้วหรือยัง
int speed = 3; //ความเร็วของวงแหวน (เริ่มต้นคือ 3)
float posX = 500;
float posY = 500;

void setup(){
  size(1920,1080); //ขนาดหน้าต่าง
  background(0); //พื้นหลังสีดำ
  fill(255,255,255); //สีของข้อความ
  textSize(30); //ขนาดของข้อความ
  text("Score : ", 100, 100); //ข้อความคำว่า Score ที่ตำแหน่ง (100,100)
}

void draw(){
  make_circle_outline(size,posX,posY); //วงแหวนขอบนอก
  make_circle(100,posX,posY); //วงแหวนขอบใน
  size = size - speed; //ลดขนาดวงแหวน
  if (size <= 0){ //ถ้าวงแหวนถึงขนาดที่กำหนด (เท่ากับวงกลมตรงกลาง)
    size = 500; //กำหนดขนาดวงแหวนใหม่
  }
  if (click == 1){ //ถ้าคลิ๊กไปแล้ว
    fill(0); //สีของสี่เหลี่ยม
    rect(190,70,60,35); //สร้างสี่เหลี่ยมที่ตำแหน่ง (190,70) ขนาด 60x35 เพื่อบังข้อความเก่า
  }
  fill(255,255,255); //สีของข้อความ
  text("Score : ", 100, 100); //ข้อความคำว่า Score ที่ตำแหน่ง (100,100)
  text(speed-3, 200, 100); //ข้อความของคะแนนที่อ้างอิงจากความเร็ว ที่ตำแหน่ง (200,100)
}

void make_circle(int size,float posX,float posY){
  if (click==1) { //ถ้าคลิ๊กไปแล้ว
    if (win==1) { //ถ้าชนะ
      fill(0,255,0); //สีของวงกลมเป็นสีเขียว
    }
    else{ //ถ้าไม่ชนะ
      fill(255,0,0); //สีของวงกลมเป็นสีแดง
    }
  }
  else{ //ถ้ายังไม่คลิ๊ก
    fill(255,255,255); //สีของวงกลมเป็นสีขาว
  }
  circle(posX, posY, size); //วาดวงกลมที่ตำแหน่ง (500,500) ขนาดเท่ากับ size
}

void make_circle_outline(float size,float posX,float posY){
  // สร้างวงแหวนจากวงกลม 3 แบบ
  fill(0);
  circle(posX,posY, 500); 
  fill(255,255,255);
  circle(posX,posY, size);
  fill(0);
  circle(posX,posY, size-10); 
}

void mousePressed() {
  if (mouseX < posX+50){
    if (mouseX > posX-50){
      if (size <= 130) { //ถ้าวงแหวนถึงขนาดที่ 110 (มากกว่าวงกลมตรงกลาง 10 หน่วย)
        win = 1; //ชนะ
        speed = speed + 1; //เพิ่มความเร็วของวงแหวน
      } else {
        win = 0; //ไม่ชนะ
        speed = speed - 1; //ลดความเร็วของวงแหวน
      }
      click=1; //กำหนดค่าว่าคลิ๊กไปแล้ว
      posX = random(0,1920);
      posY = random(0,1080);
      background(0);
    }
  }
}

void keyPressed(){
  if (keyCode == 'X'){
    if (mouseX < posX+50){
      if (mouseX > posX-50){
        if (size <= 120) { //ถ้าวงแหวนถึงขนาดที่ 120 (มากกว่าวงกลมตรงกลาง 20 หน่วย)
          win = 1; //ชนะ
          speed = speed + 1; //เพิ่มความเร็วของวงแหวน
        } else {
          win = 0; //ไม่ชนะ
          speed = speed - 1; //ลดความเร็วของวงแหวน
        }
        click=1; //กำหนดค่าว่าคลิ๊กไปแล้ว
        posX = random(0,1920);
        posY = random(0,1080);
        background(0);
      }
    }
  }

  if (keyCode == '\\'){
    speed = 3;
  }
}
