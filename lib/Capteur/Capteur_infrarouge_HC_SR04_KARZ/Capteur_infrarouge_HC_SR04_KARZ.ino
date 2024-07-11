  #include <Adafruit_NeoPixel.h>
  
  const int trigPin = 2; // Broche de déclenchement du capteur
  const int echoPin = 4; // Broche de réception du capteur
  const int ledPin = 13; // Broche de la LED
  const int seuilDistance = 50; // Seuil de distance en centimètres pour détecter une voiture
  const int neo = 7;
  const int numPixels = 12; // Nombre de NeoPixels

  Adafruit_NeoPixel pixels = Adafruit_NeoPixel(numPixels, neo, NEO_GRB + NEO_KHZ800);

  void setup() {
    pinMode(trigPin, OUTPUT);
    pinMode(echoPin, INPUT);
    pinMode(ledPin, OUTPUT);
    Serial.begin(9600);
    
    pixels.begin(); // Initialisation des NeoPixels
    pixels.show(); // Éteindre tous les pixels au départ
  }

  void loop() {
    long duree, distance;

    // Envoi d'une impulsion de déclenchement
    digitalWrite(trigPin, LOW);
    digitalWrite(neo, HIGH);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);

    // Lecture de la durée de l'impulsion reçue
    duree = pulseIn(echoPin, HIGH);

    // Calcul de la distance en centimètres
    distance = (duree * 0.0343) / 2;

    Serial.print("Distance: ");
    Serial.print(distance);
    Serial.println(" cm");

    // Allumer la LED si la distance est inférieure au seuil spécifié
    if (distance < seuilDistance) {
      digitalWrite(ledPin, HIGH);
      // Allumer tous les NeoPixels
     for(int i=0; i<numPixels; i++) {
      pixels.setPixelColor(i, pixels.Color(0, 255, 0)); // Rouge
    }
    pixels.show();
    } else {
      digitalWrite(ledPin, LOW);
      for(int i=0; i<numPixels; i++) {
      pixels.setPixelColor(i, pixels.Color(255, 0, 0)); // Éteint
         }
    pixels.show();
    }

    delay(500); // Attendre un peu entre les mesures
  }
