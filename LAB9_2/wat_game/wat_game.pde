int posX = 960;
int posY = 540;

void setup(){
    size(1920,1080);
    background(255);
}

void draw(){
    player(mouseX,mouseY);
    ball(posX,posY);
    
}

void player(int posX, int posY){
    background(255);
    fill(0);
    circle(posX,posY,50);
    line(posX,posY+25,posX,posY+80);
    line(posX-20,posY+40,posX+20,posY+40);
    line(posX,posY+80,posX+20,posY+100);
    line(posX,posY+80,posX-20,posY+100);
}

void ball(int posX, int posY){
    fill(0);
    circle(posX,posY,50);
}

void keyPressed(){
    if(key == '\\'){
        background(255);
    }
}
