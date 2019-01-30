/**
 *  On Raspberry Pi: increase your GPU memory, to avoid
 *  OpenGL error 1285 at top endDraw(): out of memory
 */

import gohai.glvideo.*;
import processing.serial.*;

GLMovie video;
Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

int startHour = 10;
int startMinute = 30;
int endHour = 10;
int endMinute = 32;

boolean useTimeControl = true;

boolean isProjectorOn = false;

void setup() {
  size(1024, 768, P2D);
  video = new GLMovie(this, "output.mp4");
  video.loop();

  for (String port : Serial.list()) {
    println(port);
  }
  String portName = Serial.list()[2];
  println(portName);
  myPort = new Serial(this, portName, 9600);

  noCursor();
}

void draw() {
  background(0);
  if (video.available()) {
    video.read();
  }
  fill(255);
  image(video, 0, 0, width, height);
  
  if(!useTimeControl)return;
  int hour = (frameCount / 300) % 24;
  int minute = frameCount / 5 % 60;
  hour = hour();
  minute = minute();
  fill(0);
  if (
    hour < startHour || 
    hour == startHour && minute < startMinute|| 
    hour == endHour && minute >= endMinute|| 
    hour > endHour
  ) {
    if(isProjectorOn){
      myPort.write("* 0 IR 002\r\n");
      isProjectorOn = false;
    }
    rect(0, 0, width, height);
  }else{
    if(!isProjectorOn){
      myPort.write("* 0 IR 001\r\n");
      myPort.write("* 0 IR 050\r\n");
      isProjectorOn = true;
    }
  }
  //text(hour+":"+minute,100,100);
}
