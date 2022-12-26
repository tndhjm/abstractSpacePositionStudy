class CurrentPosInterface {
    PGraphics posWindow;
    int windowX, windowY;
    int windowSize;
    int sphereSize, imageSize;

    CurrentPosInterface(int windowSize, int wX, int wY, int sphrSz, int imgSz) {
        this.windowSize = windowSize;
        posWindow = createGraphics(windowSize, windowSize, P3D);
        windowX = wX-windowSize;
        windowY = wY-windowSize;

        sphereSize = sphereSize;
        imageSize = imgSz;
    }

    void drawWindow(){        
        posWindow.beginDraw();
        // posWindow.background(0);

        posWindow.translate(windowSize/2, windowSize/2, 0);

        posWindow.noFill();
        posWindow.strokeWeight(1);
        posWindow.stroke(255, 255, 255, 100);
        posWindow.sphere( imageSize-10 );

        posWindow.rotateX(cam.getRotations()[0]);
        posWindow.rotateY(cam.getRotations()[1]);
        posWindow.rotateZ(cam.getRotations()[2]);

        posWindow.pushMatrix();
            posWindow.translate(0, 0, imageSize);
            posWindow.noStroke();
            posWindow.fill(200, 30, 0);
            posWindow.sphere(sphereSize);
        posWindow.popMatrix();


        posWindow.endDraw();
        
    }

    void dispWindow() {
        drawWindow();
        cam.beginHUD();
        image(posWindow, windowX, windowY, windowSize, windowSize);
        cam.endHUD();
    }

}
