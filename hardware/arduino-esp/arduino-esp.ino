#include <Adafruit_MQTT.h>
#include <Adafruit_MQTT_Client.h>

#include <Wire.h>
#include <ESP8266WiFi.h>
//MQTT Details
//#define MQTT_SERVER "209.197.184.197"
#define MQTT_SERVER "100.64.130.153"
#define MQTT_PORT 1883                    
#define MQTT_USERNAME "" 
#define MQTT_PASSWORD "" 

char ssid[10] = "UofTHacks";
char password[20] = "stanthemoose";

WiFiClient client; 
Adafruit_MQTT_Client mqtt(&client, MQTT_SERVER, MQTT_PORT, MQTT_USERNAME, MQTT_PASSWORD); 
Adafruit_MQTT_Publish potholes = Adafruit_MQTT_Publish(&mqtt, MQTT_USERNAME "potholes");
Adafruit_MQTT_Subscribe potholes_p = Adafruit_MQTT_Subscribe(&mqtt, MQTT_USERNAME "potholes-a");

String arduinoprocess = "";
bool mqttConnected;

void setup(){

  Serial.begin(9600);
  WiFi.begin(ssid, password);     //Connect to your WiFi router
  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  //MQTT Init
  mqtt.subscribe(&potholes_p);
  mqttConnected = MQTT_connect(); 
  
}

void loop() {
  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription())) {
    if (subscription == &potholes_p) {
      String lastread;
      lastread = ((char *)potholes_p.lastread);
      if (lastread == "GO") {
        Serial.println("GO"); 
      }
    }
  }
  arduinoprocess = "";
  arduinoprocess = readSerial();
  char arduinoprocesschar[arduinoprocess.length() + 1];
  arduinoprocess.toCharArray(arduinoprocesschar, arduinoprocess.length() + 1);
  if (mqttConnected) {
    if (arduinoprocess != "") {
      potholes.publish(arduinoprocesschar);
    }
  }
}

String readSerial() {
  String input;
  while (Serial.available()) {
    char c = (char)Serial.read();
    if (c != 0x0A && c != 0x0D) {
      //Block Newline / Carriage Return Characters
      input += c;
    }
  }
  return input;
}
