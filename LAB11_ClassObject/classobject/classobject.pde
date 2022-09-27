class Ball{
    float posX;
    float posY;
    float speedX;
    float speedY;
    float radius;

    Ball(float posX, float posY, float speedX, float speedY, float radius){
        this.posX = posX;
        this.posY = posY;
        this.speedX = speedX;
        this.speedY = speedY;
        this.radius = radius;
    }
    void display(){
        ellipse(this.posX, this.posY, this.radius * 2, this.radius * 2);
        fill(random(255),random(255),random(255));

    }

    void move(){
        this.posX = this.posX + this.speedX;
        this.posY = this.posY + this.speedY;

        if(this.posX > width - this.radius || this.posX < this.radius){
            this.speedX *= -1;
        }
        if(this.posY > height - this.radius || this.posY < this.radius){
            this.speedY *= -1;
        }
        //background(0);
    }
}

Ball b1; // Crate object
Ball[] allBall = new Ball[50]; // Create array of object

void setup(){
    size(1920, 1080);
    background(0);
    
    int i = 0;
    while (i < 10){
        
        allBall[i] = new Ball(250, 250, 1, 1, 50);
        i = i + 1;
    }
}

void draw(){

    int i = 0;
    while (i<10){
        allBall[i].display();
        allBall[i].move();
        i = i + 1;
    }
}

void keyPressed(){
    //if (key == '+'){
    //    int i = 0;
    //    while (i<100){
    //        allBall[i]
    //        i = i + 1;
    //    }
    //}
    if (keyCode == UP){
        allBall[1].speedY -= 1;
    }
    if (keyCode == DOWN){
        allBall[1].speedY += 1;
    }
    if (keyCode == LEFT){
        allBall[1].speedX -= 1;
    }
    if (keyCode == RIGHT){
        allBall[1].speedX += 1;
    }
    println("Speed X: "+allBall[1].speedX);
    println("Speed Y: "+allBall[1].speedY);
}
