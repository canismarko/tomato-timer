/*
  Tomato Timer

  Creates a countdown timer for staying on track during boring work.

  Exampes usage: work for 25 min, then break for 5,
  then work for 25, etc. Every 4 work periods,
  there is a longer 20 minutes break.

  January 2017
  Mark Wolf
*/

#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// Prepare the NeoPixels
#define STRIP_PIN 6
#define RING_PIN 8 // Swap these
#define N_RING 12
#define N_STRIP 30
// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(N_STRIP, STRIP_PIN, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel ring = Adafruit_NeoPixel(N_RING, RING_PIN, NEO_GRB + NEO_KHZ800);

// COLORS
#define BRIGHTNESS 10 // 0-100
#define PURPLE strip.Color(255, 0, 255)
#define TEAL strip.Color(0, 128, 64)
#define BLACK strip.Color(0, 0, 0)
#define STRIP_OFF TEAL
#define RING_OFF BLACK
#define C_WORK PURPLE
#define C_REST strip.Color(0, 255, 0)

// Durations for each phase (in milliseconds)
// Eg. 5 * 60 * 1000 --> 5 min
#define TICK 400
#define DEBUG_SPEEDUP 1 // Set to 1 for normal operation
#define WORK_TIME 25 * 60 * 1000ul / DEBUG_SPEEDUP
#define BREAK_TIME 5 * 60 * 1000ul / DEBUG_SPEEDUP
#define BREAK_TIME_LONG BREAK_TIME * 4

#define TONE_HZ 200

// Possible states for the system
#define WORKING 0
#define BREAK 1
#define LONG_BREAK 2
#define EXPIRED 3
#define STOPPED 4

// Button and buzzer pin assignments
#define BTN_START 2
#define BTN_STOP 3
// #define BTN_PIN 2
// #define BTN_STOP 19
// #define MUTE_PIN 2
#define BUZZER A0

// LED pin assignments
#define RED0 7
#define RED1 5
#define RED2 4
#define RED3 6
#define RED4 8
#define GRN0 10
#define GRN1 11
#define GRN2 12
#define GRN3 13
#define GRN4 9

// Define pins for the red and green LED's
const int N_REDS = 5;
const int RED_PINS[N_REDS] = {RED0, RED1, RED2, RED3, RED4};
const int N_GRNS = 5;
const int GRN_PINS[N_GRNS] = {GRN0, GRN1, GRN2, GRN3, GRN4};

// Variable for keeping track of how long this round has been running
unsigned long startTime;

// Variable to keep track of which round of work we're on
unsigned long currentRound;
bool isStopped; // Are we currently paused
bool volatile btnPressed;
bool volatile useBuzzer;
bool volatile stopRequested; // Is the system waiting for a stop button handler

// Function to keep track of when the button was pressed
void press_button() {
  Serial.print("Start button pressed\n");
  btnPressed = true;
}

void stop_pressed() {
  Serial.print("Stop requested\n");
  stopRequested = true;
}


// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85) {
    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
}


// Function for advancing to the next round of work
void start_next_round() {
  // Flash the lights to indicate the round number
  if (currentRound > 0) {
    sound_buzzer(LOW);
    setAllPixels(ring, RING_OFF);
    setAllPixels(strip, STRIP_OFF);
    delay(TICK / 2);
    for (int j=0; j<currentRound; j += 1) {
      // sound_buzzer(HIGH);
      setAllPixels(ring, C_WORK);
      setAllPixels(strip, C_WORK);      
      delay(TICK / 5);
      sound_buzzer(LOW);
      setAllPixels(ring, RING_OFF);
      setAllPixels(strip, STRIP_OFF);
      delay(TICK);
    }
    delay(TICK / 5);
  }
  // Log to serial console
  Serial.print("Advancing to round ");
  Serial.print(currentRound);
  Serial.print("\n");
  // Update state variables
  isStopped = false;
  currentRound += 1;
  startTime = millis();
  btnPressed = false;
  useBuzzer = true;
  // Turn off buzzer and pause for a moment
  noTone(BUZZER);
  delay(2*TICK);
}


// Global variable for whether to sound the buzzer (gets reset every round)
void mute_buzzer() {
  Serial.print("Silencing buzzer\n");
  useBuzzer = false;
}

// Function that either turns on or turns off the buzzer
void sound_buzzer(int state) {
  if (state == HIGH && useBuzzer) {
    tone(BUZZER, TONE_HZ);
  } else {
    noTone(BUZZER);
  }
}


// Function sets all pins in an arrayset
void writeRedPins(int state) {
  for (int i = 0; i < N_REDS; i += 1) {
    digitalWrite(RED_PINS[i], state);
  }
}


// Function sets all pins in an array
void writeGreenPins(int state) {
  for (int i = 0; i < N_GRNS; i += 1) {
    digitalWrite(GRN_PINS[i], state);
  }
}


void setAllPixels(Adafruit_NeoPixel &pixel, uint32_t c) {
  // Set all the neopixels to the given color
  for (uint16_t i=0; i < pixel.numPixels(); i++) {
    pixel.setPixelColor(i, c);
  }
  pixel.show();  
}


void setRingLights(int numOn, uint32_t color) {
  // Set a certain number of LEDs on the ring to on
  for (int i=0; i<numOn; i++) {
    ring.setPixelColor(i, color);
  }
  // Set the remaining LEDs off
  for (int i=numOn; i<N_RING; i++) {
    ring.setPixelColor(i, RING_OFF);
  }
  ring.show();
}


// Function that fluorishes the lights, then waits for the user to press the "Go" button
void pauseInit() {
  Serial.print("Pausing init\n");
  // Cycle through the lights
  for (byte i=0; i < 255; i=i+1) {
    uint32_t color = Wheel(i);
    // Set the strip LED to on
    uint16_t pxIdx = i * N_STRIP / 255;
    strip.setPixelColor(pxIdx, color);
    // Set the ring LED to on
    pxIdx = i * N_RING / 255;
    ring.setPixelColor(pxIdx, color);
    // Update the device and wait for a bit
    strip.show();
    ring.show();
    delay(0.5);
  }
  // Cycle off the lights
  for (byte i=0; i < 255; i=i+1) {
    // Set the strip LED to on
    // uint16_t pxIdx = N_STRIP - (i * N_STRIP / 255) - 1;
    uint16_t pxIdx = i * N_STRIP / 255;
    strip.setPixelColor(pxIdx, STRIP_OFF);
    // Set the ring LED off
    // pxIdx = N_RING - (i * N_RING / 255) - 1;
    pxIdx = i * N_RING / 255;
    ring.setPixelColor(pxIdx, RING_OFF);
    // Update the device and wait for a bit
    strip.show();
    ring.show();
    delay(0.5);
  }
}


// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);

  // Initialize the Neo Pixels
  strip.begin();
  ring.setBrightness(BRIGHTNESS);
  strip.show(); // Initialize all pixels to 'off'
  ring.begin();
  ring.setBrightness(BRIGHTNESS);
  ring.show(); // Initialize all pixels to 'off'
  
  // Set the interrupt for when the various buttons are pressed
  // attachInterrupt(digitalPinToInterrupt(MUTE_PIN), mute_buzzer, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN_START), press_button, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN_STOP), stop_pressed, RISING);

  // Start of on the first round
  isStopped = true;
  currentRound = 0;

  // Wait for the user to press the go button
  pauseInit();

  // And away we gooooo....
  startTime = millis();
}

// Function that returns the current state based on elapsed time for this round
int currentState() {
  unsigned long elapsed = millis() - startTime;
  // Variable for holding the output
  int state;
  // Variable for how long the break should be this time around
  unsigned long round_time;
  // Variable for which break period we're in
  int break_type;
  if (currentRound % 4) {
    // Regular short break
    round_time = WORK_TIME + BREAK_TIME;
    break_type = BREAK;
  } else {
    // Every fourth round is a long break
    round_time = WORK_TIME + BREAK_TIME_LONG;
    break_type = LONG_BREAK;
  }
  // Now see what phase we're in based on how long we've been running
  if (isStopped) {
    state = STOPPED;
  } else if (elapsed < WORK_TIME) {
    // Just regular old working mode
    state = WORKING;
  } else if (elapsed < round_time) {
    // We're in a break
    state = break_type;
  } else {
    // Break is over, and we need to get back to work!
    state = EXPIRED;
  }
  return state;
}


void loop() {

  int state = currentState();
  
  // Check if the user pressed a button during the last loop
  if (btnPressed) {
    if (state == WORKING && currentRound > 0) {
      currentRound -= 1;
    }
    start_next_round();
  }

  unsigned long runTime = millis() - startTime;
  char tickPhase = (runTime) % (TICK * 2) / TICK;
  if (stopRequested) {
    Serial.print("Stopping\n");
    isStopped = true;
    stopRequested = false;
    sound_buzzer(LOW);
    writeGreenPins(LOW);
    writeRedPins(LOW);
    if (state == WORKING && currentRound > 0) {
      currentRound -= 1;
    }
    // Wait for the user to advance to the next round
    pauseInit();
    // And away we gooooo....
    startTime = millis();
  } else if (state == WORKING) {
    // Set the LEDs while working
    int n_leds = (WORK_TIME - runTime) / (WORK_TIME / (N_RING)) % (N_RING);
    setRingLights(n_leds + 1, C_WORK);
    setAllPixels(strip, C_WORK);
  } else if (state == BREAK) {
    // Set the LEDs while taking a short break
    int n_leds = (WORK_TIME + BREAK_TIME - runTime) / (WORK_TIME / (N_RING)) % (N_RING);
    setRingLights(n_leds + 1, C_REST);
    setAllPixels(strip, C_REST);
  } else if (state == LONG_BREAK) {
    // Set the LEDs while taking a long break
    int n_leds = (WORK_TIME + BREAK_TIME_LONG - runTime) / (WORK_TIME / (N_RING)) % (N_RING);
    setRingLights(n_leds + 1, C_REST);
    setAllPixels(strip, C_REST);
  } else if (state == EXPIRED) {
    sound_buzzer(tickPhase);
    if (tickPhase == LOW) {
      setAllPixels(strip, C_WORK);
      setAllPixels(ring, C_WORK);
    } else {
      setAllPixels(strip, STRIP_OFF);
      setAllPixels(ring, RING_OFF);
    }
    // writeRedPins(tickPhase);
    // writeGreenPins(LOW);
  }

  // Check if the buzzer should sound to alert that a break has just started
  if (runTime > WORK_TIME && runTime < WORK_TIME + 6*TICK) {
    sound_buzzer(tickPhase);
  } else if (state != EXPIRED) {
    sound_buzzer(LOW);
  }

  delay(TICK);
}



















