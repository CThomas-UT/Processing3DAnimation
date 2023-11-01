class Cam{
    float screen_height, screen_width, x, y, z, subX, subY, subZ;
    float angle = 0;
    
    Cam (float screen_width, float screen_height, float subX, float subY, float subZ){
        this.screen_width = screen_width;
        this.screen_height = screen_height;
        this.y = 0;
        this.x = cos(angle) * (screen_width / 2);
        this.z = sin(angle) * (screen_width / 2);
        this.subX = subX;
        this.subY = subY;
        this.subZ = subZ;
    }

    // must move from - half width to half width
    // -x, -z to x, -z, to x, z to -x, z to -x,-z
    void camOrbit(){
        this.x = cos(angle) * (screen_width / 4);
        this.z = sin(angle) * (screen_width / 4);
        camera(this.x, this.y, this.z, this.subX, this.subY, this.subZ, 0, 1, 0);
        pointLight(255, 255, 255, this.x, this.y, this.z);
        angle += 0.02;

    }

    void adjustY(float amt){
        this.y = constrain(this.y += amt, -this.screen_height / 4, 15);
    }


    // the code below was provided by the chatGPT response found in gpt.txt, used this to move the camera in a circular path
    // float angle = 0;
    // float radius = 100; // The radius of the circular path
    // background(255);

    // // Calculate x and z positions based on angle
    // float x = cos(angle) * radius;
    // float z = sin(angle) * radius;

    // // Draw a sphere at the calculated position (y is kept at 0)
    // translate(width / 2, height / 2, 0); // Move the origin to the center of the canvas
    // lights(); // Enable 3D lighting
    // fill(255, 0, 0); // Red color for the sphere
    // noStroke(); // No outline for the sphere
    // sphere(20); // Draw the sphere

    // // Increment the angle to make the sphere move in a circular path
    // angle += 0.02;
}
