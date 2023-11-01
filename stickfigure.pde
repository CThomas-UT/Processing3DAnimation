class StickFigure{
    float x, y, z, scale, hip_angle, starting_Z, ending_Z;
    boolean neo;
    float arm_angle = 0;
    float startRotation = PI/3;
    float endRotation = PI * 0.6;
    PShape gun, bullet;

    StickFigure(float x, float y, float z, float scale, float hip_angle, boolean neo){
        this.x = x;
        this.y = y;
        this.z = z;
        this.scale = scale;
        this.hip_angle = hip_angle;
        this.arm_angle = arm_angle;
        this.neo = neo;
        this.gun = loadShape("Gun.obj");
        this.bullet = loadShape("shareablebullet.obj");
    }

    void noggin(){
        pushMatrix();
        // for testing
        fill(190);
        translate(this.x, this.y, this.z);
        rotateX(this.hip_angle);
        scale(this.scale);
        // sets the radius to 20, so for the body, we want to have it be equal to the radius, but start back half the radius
        sphere(20);
        popMatrix();
    }

    void chest(){
        pushMatrix();
        // for testing
        fill(20);
        translate(this.x, this.y, this.z);
        rotateX(this.hip_angle);
        scale(this.scale);
        translate(0, 40, 0);
        // make body 3x as big as head radius (1.5x head size)
        box(20, 60, 20);
        popMatrix();
    }

    void legs(){
        pushMatrix();
        // for testing
        fill(20);
        translate(this.x, this.y, this.z);
        rotateX(this.hip_angle);
        scale(this.scale);
        translate(0, 100, 0);
        rotateX(-this.hip_angle);
        if (this.neo){
          translate(0,30,25);
        }
        pushMatrix();
        translate(-6, -12, 0);
        box(10, 40, 10);
        popMatrix();
        pushMatrix();
        translate(6, -12, 0);
        box(10, 40, 10);
        popMatrix();   
        popMatrix();        
    }

    void arm(float x_arm, float y_arm, float z_arm, float arm_angle){
        pushMatrix();
        rotateX(arm_angle);
        translate(x_arm, y_arm, z_arm);
        box(10, 40, 10);
        if (this.neo == false) {
            pushMatrix();
            rotateY(PI/2);
            rotateZ(PI/2);
            translate(-30,5,0);
            scale(50);
            shape(this.gun);            
            popMatrix();

        }
        popMatrix();
    }

    void armsRotate(){
        pushMatrix();
        // for testing
        fill(20);
        translate(this.x, this.y, this.z);
        rotateX(this.hip_angle);
        scale(this.scale);
        translate(0, 20, 0);
        pushMatrix();
        arm(-15, -20, 0, this.arm_angle);
        popMatrix();
        pushMatrix();
        arm(15, -20, 0, this.arm_angle + PI);
        popMatrix();

        popMatrix();
        this.arm_angle -= 0.02;
    }


    void armsShoot(){
        float counter = .5 * (sin(arm_angle) + 1);
        float counter2 = .5 * (sin(arm_angle + PI/4) + 1);
        float rotation1 = lerp(startRotation, endRotation, counter);
        float rotation2 = lerp(startRotation, endRotation, counter2);

        pushMatrix();
        // for testing
        fill(20);
        translate(this.x, this.y, this.z);
        rotateX(this.hip_angle);
        rotateY(PI);
        scale(this.scale);
        translate(0, 20, 0);
        pushMatrix();
        arm(-15, -20, 0, rotation1);
        popMatrix();
        pushMatrix();
        arm(15, -20, 0, rotation2);
        popMatrix();

        popMatrix();
        arm_angle += 0.05;    
    }


    float counter1 = 0;
    float counter2 = .5;

    
    void bulletShot(){
        ending_Z = -this.z;
        starting_Z = this.z;
        if (counter1 > 1){
            counter1 = 0;
        }
        if (counter2 > 1) {
            counter2 = 0;
        }
        float z_val1 = lerp(starting_Z, ending_Z, counter1);
        float z_val2 = lerp(starting_Z, ending_Z, counter2);

        pushMatrix();
        translate(this.x + 20, this.y + 20, z_val1);
        rotateX(PI/2);
        scale(10);
        shape(this.bullet);
        
        popMatrix();
        pushMatrix();
        translate(this.x - 20, this.y + 20, z_val2);
        rotateX(PI/2);
        scale(10);
        shape(this.bullet);
        
        popMatrix();
        counter1 += .02;
        counter2 += .02;
    }

    void display(){
        this.noggin();
        this.chest();

        if (this.neo) {
            this.armsRotate();
        } else {
            this.armsShoot();
            this.bulletShot();
            

            
            
        }
        this.legs();
        
    }



}
