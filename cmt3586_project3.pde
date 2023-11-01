Backdrop bg;
Cam cam;
StickFigure neo, smith;
float neo_x, neo_y, neo_z;

void setup() {
    neo_x = 0;
    neo_y = 0;
    neo_z = 0;
    size(600, 600, P3D);
    bg = new Backdrop(width, height, "Panorama.jpg", "dirtJPG.jpg", "skyJPG.jpg");
    cam = new Cam(width, height, neo_x, neo_y, neo_z);
    neo = new StickFigure(neo_x, neo_y, neo_z, 1, -PI/2, true);
    smith = new StickFigure(neo_x, neo_y - 60,neo_z - width*.75, 1, 0, false);
    directionalLight(200, 200, 200, 1, 1, 0);
}

void keyPressed(){
    if (key == 'u') {
        cam.adjustY(-5);
    } else if (key == 'd') {
        cam.adjustY(5);
    }

}

void draw() {
    noStroke();
    fill(200);
    background(0);
    ambientLight(40, 40, 60);
    cam.camOrbit();
    bg.display();
    neo.display();
    smith.display();
    
}
