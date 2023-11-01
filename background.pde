class Backdrop{
    float screen_width;
    float screen_height;
    PImage panorama;
    PImage floor;
    PImage sky;
    Backdrop(float screen_width, float screen_height, String panorama_jpg, String floor_jpg, String sky_jpg){
        this.screen_width = screen_width;
        this.screen_height = screen_height;
        this.panorama = loadImage(panorama_jpg);
        this.floor = loadImage(floor_jpg);
        this.sky = loadImage(sky_jpg);
        textureMode(NORMAL);
    }

    void display(){
        textureWrap(CLAMP);
        // for each, the x would be 0.25 increments and the y would be 1, width and height must be 2x original
        pushMatrix();
        translate(-this.screen_width, -this.screen_height, -this.screen_width);
        beginShape(QUADS);
        texture(this.panorama);
        vertex(0, 0, 0, 0, 0);
        vertex(this.screen_width * 2, 0, 0, 0.25, 0);
        vertex(this.screen_width * 2, this.screen_height * 2, 0, 0.25, 1);
        vertex(0, this.screen_height * 2, 0, 0, 1);
        endShape();    
        popMatrix();

        pushMatrix();
        rotateY(PI/2);
        translate(-this.screen_width, -this.screen_height, -this.screen_width);
        beginShape(QUADS);
        texture(this.panorama);
        vertex(0, 0, 0, 0.25, 0);
        vertex(this.screen_width * 2, 0, 0, 0.5, 0);
        vertex(this.screen_width * 2, this.screen_height * 2, 0, 0.5, 1);
        vertex(0, this.screen_height * 2, 0, 0.25, 1);
        endShape();    
        popMatrix();

        pushMatrix();
        rotateY(PI);
        translate(-this.screen_width, -this.screen_height, -this.screen_width);
        beginShape(QUADS);
        texture(this.panorama);
        vertex(0, 0, 0, 0.5, 0);
        vertex(this.screen_width * 2, 0, 0, 0.75, 0);
        vertex(this.screen_width * 2, this.screen_height * 2, 0, 0.75, 1);
        vertex(0, this.screen_height * 2, 0, 0.5, 1);
        endShape();    
        popMatrix(); 

        pushMatrix();
        rotateY(3*PI/2);
        translate(-this.screen_width, -this.screen_height, -this.screen_width);
        beginShape(QUADS);
        texture(this.panorama);
        vertex(0, 0, 0, 0.75, 0);
        vertex(this.screen_width * 2, 0, 0, 1, 0);
        vertex(this.screen_width * 2, this.screen_height * 2, 0, 1, 1);
        vertex(0, this.screen_height * 2, 0, 0.75, 1);
        endShape();    
        popMatrix();

        // floor
        textureWrap(REPEAT);
        pushMatrix();
        rotateX(PI/2);
        translate(-this.screen_width, -this.screen_width, -40);
        beginShape(QUADS);
        texture(this.floor);
        vertex(0, 0, 0, 0, 0);
        vertex(this.screen_width * 2, 0, 0, 1, 0);
        vertex(this.screen_width * 2, this.screen_width * 2, 0, 1, 1);
        vertex(0, this.screen_width * 2, 0, 0, 1);
        endShape();    
        popMatrix();

        // sky
        pushMatrix();
        rotateX(-PI/2);
        translate(-this.screen_width, -this.screen_width, -this.screen_height);
        beginShape(QUADS);
        texture(this.sky);
        vertex(0, 0, 0, 0, 0);
        vertex(this.screen_width * 2, 0, 0, 1, 0);
        vertex(this.screen_width * 2, this.screen_width * 2, 0, 1, 1);
        vertex(0, this.screen_width * 2, 0, 0, 1);
        endShape();    
        popMatrix();       
    }
}
