/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

void setup() 
{
  size(200, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  for (String port : Serial.list()) {
    println(port);
  }
  String portName = Serial.list()[5];
  println(portName);
  myPort = new Serial(this, portName, 9600);
  // myPort.write("001\r"); 
  myPort.write("* 0 IR 002\r\n");
}

void draw() {
  if (frameCount == 100) {
    println(frameCount);
    //myPort.write("* 0 IR 002\r\n");
  }
  if ( myPort.available() > 0) {  // If data is available,
    println(myPort.read());         // read it and store it in val
  }
}