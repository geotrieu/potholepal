#include <AFMotor.h>
#include "LedControl.h" //  need the library
LedControl lc=LedControl(4,2,3,1); //

//Motor Pins
//Motor 1
int enA = 10;
int in1 = 9;
int in2 = 8;
//Motor 2
int enB = 5;
int in3 = 7;
int in4 = 6;
//Ultrasonic
int trigPin = 11;    // Trigger
int echoPin = 12;    // Echo
long duration, cm, inches;

int initCycles = 5;

byte arrow[] = { B00011000,B00011000,B00011000,B00011000,B00011000,B01111110,B00111100,B00011000};
byte nothing[] = { B00000000,B00000000,B00000000,B00000000,B00000000,B00000000,B00000000,B00000000};

void setup()
{
  Serial.begin (9600);
  //Define inputs and outputs
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  //Set Speeds (calibrated for turning)
  /*analogWrite(enA, 102);
  analogWrite(enB, 130);*/
  analogWrite(enA, 162);
  analogWrite(enB, 190);
  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  digitalWrite(in3, HIGH);
  digitalWrite(in4, LOW);

  lc.shutdown(0,false);// turn off power saving, enables display
  lc.setIntensity(0,8);// sets brightness (0~15 possible values)
  lc.clearDisplay(0);// clear screen
}

void loop()
{
  // Nothing here. We'll get to this in the next experiment.
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
 
  // Read the signal from the sensor: a HIGH pulse whose
  // duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);
 
  // Convert the time into a distance
  cm = (duration/2) / 29.1;     // Divide by 29.1 or multiply by 0.0343
  if (cm > 10 && initCycles <= 0) {
    delay(125);
    digitalWrite(in1, LOW);
    digitalWrite(in2, LOW);
    digitalWrite(in3, LOW);
    digitalWrite(in4, LOW);
    Serial.println("HOLE1");
    while(true) {
      writeArduinoOnMatrix();
      delay(500);
      writeNothing();
      delay(500);
    }
  } else {
    digitalWrite(in1, HIGH);
    digitalWrite(in2, LOW);
    digitalWrite(in3, HIGH);
    digitalWrite(in4, LOW);
  }
  if (initCycles > 0) initCycles--;
}

void writeNothing() {
  lc.setRow(0,0,nothing[0]);
  lc.setRow(0,1,nothing[1]);
  lc.setRow(0,2,nothing[2]);
  lc.setRow(0,3,nothing[3]);
  lc.setRow(0,4,nothing[4]);
  lc.setRow(0,5,nothing[5]);
  lc.setRow(0,6,nothing[6]);
  lc.setRow(0,7,nothing[7]);
}
 
void writeArduinoOnMatrix() {
 
  /* now display them one by one with a small delay */
  lc.setRow(0,0,arrow[0]);
  lc.setRow(0,1,arrow[1]);
  lc.setRow(0,2,arrow[2]);
  lc.setRow(0,3,arrow[3]);
  lc.setRow(0,4,arrow[4]);
  lc.setRow(0,5,arrow[5]);
  lc.setRow(0,6,arrow[6]);
  lc.setRow(0,7,arrow[7]);
}
