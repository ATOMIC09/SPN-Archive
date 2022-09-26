int x = 0;


void setup(){
    size(400,400);
    background(0);
}

void draw(){
    textSize(30);
    if (x > 0){
        text(x,160,200);
        text("is positive",200,200);
    }
    else{
        if (x == 0){
            text(x,160,200);
            text("is zero",200,200);
        }
        else{
            text(x,160,200);
            text("is negative",200,200);
        }
    }
}

void keyPressed(){
    if (keyCode == UP){
        x = x + 1;
    }
    if (keyCode == DOWN){
        x = x - 1;
    }
    background(0);
}
