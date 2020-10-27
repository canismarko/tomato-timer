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
#define STRIP_PIN 7
#define RING_PIN 6 // Swap these
#define N_RING 12
#define N_STRIP 75
// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(N_STRIP, STRIP_PIN, NEO_GRBW + NEO_KHZ800);
Adafruit_NeoPixel ring = Adafruit_NeoPixel(N_RING, RING_PIN, NEO_GRB + NEO_KHZ800);

// Holds color definitions for both the strip and the ring
struct Color{
  uint32_t strip;
  uint32_t ring;
};

// COLORS
#define BRIGHTNESS 10 // 0-100
#define NEW_BLUE 0, 0, 255
#define BLUE strip.Color(0, 0, 255)
Color TEAL = {strip.Color(0, 128, 64), ring.Color(0, 128, 64)};
Color PURPLE  = {strip.Color(255, 50, 255), ring.Color(255, 50, 255)};
Color GREEN = {strip.Color(0, 255, 0), ring.Color(0, 255, 0)};
Color DARK_PURPLE = {strip.Color(0, 0, 48, 0), strip.Color(0, 48, 48)};
Color DARK_BLUE = {strip.Color(48, 0, 48, 0), strip.Color(48, 0, 48)};
Color BLACK = {strip.Color(0, 0, 0), ring.Color(0, 0, 0)};
Color WHITE = {strip.Color(0, 48, 48, 128), strip.Color(255, 205, 205)};


Color c_stopped;  // Changed by pressing the stop button
#define C_OFF DARK_PURPLE
#define C_WORK PURPLE
#define C_REST GREEN

// Durations for each phase
#define TICK 400 // In milliseconds
#define LOOP_TICK 50 // In millisecond
#define DEBUG_SPEEDUP 1 // Set to 1 for normal operation
const unsigned long WORK_SEC = 25 * 60; // 25 min (in seconds)
const unsigned long BREAK_SEC = 5 * 60; // 5 min (in seconds)
#define SHORT_PER_LONG 3 // How many short breaks to each long breaksss
#define STOP_COLOR_SPEED 5.0 // 1 = 65.536 seconds

#define TONE_HZ 200

// Possible states for the system
#define STOPPED 0
#define STARTING 1
#define RUNNING 2
#define BREAK 3
#define EXPIRED 4
#define STOPPING 5

// Button and buzzer pin assignments
#define BTN_START 2
#define BTN_STOP 3
#define BUZZER A1

// Flags for setting different dimming levels for the lights
#define N_DIM_LEVELS 3
#define DIM_OFF 2
#define DIM_LOW 1
#define DIM_HIGH 0
int stopDimLevel = DIM_HIGH;

// Flags for handling button presses
bool stopPending = 0;

// Variables for debouncing buttons
#define DEBOUNCE_MS 150
unsigned long lastBtnPress;

// Variable for keeping track of how long this round has been running
unsigned long startTime;
char state;
long roundNum;

// Variable for keeping track of if the user has silenced the buzzer
bool isSilenced;
#define AUDIBLE 0
#define SILENCED 1

// Function headers
void setAllPixels(Adafruit_NeoPixel &pixel, uint32_t c, bool keepBluePin=false);

bool isNewBtnPress() {
  // Check if it's been long enough since the last button press registered
  //   to consider this a unique button press.
  unsigned long deltaBtnPress = millis() - lastBtnPress;
  lastBtnPress = millis();
  if (deltaBtnPress > DEBOUNCE_MS) {
    return true;
  } else {
    return false;
  }
}

// Function to start a work sesstion when the user presses the button
void start_pressed() {
  if (isNewBtnPress()) {
  Serial.print("Start button pressed\n");
    if (state != RUNNING) {
      state = STARTING;
    }
  }
}


void stop_pressed() {
  if (isNewBtnPress()) {
    stopPending = 1;
  };
}

Color stopped_color() {
  Color color;
  Serial.print("stopped_color() dim level: ");
  Serial.println(stopDimLevel);
  switch (stopDimLevel) {
    case DIM_OFF :
      color = BLACK;
      break;
    case DIM_LOW :
      color = DARK_PURPLE;
      break;
    case DIM_HIGH :
      color = WHITE;
      break;
  }
  return color;
}

void stop_timer() {
  Serial.println("Responding to stop button press.");
  stopPending = 0;
  if (isSilenced == AUDIBLE && state == EXPIRED) {
    Serial.println("Buzzer silenced");
    isSilenced = SILENCED;
  } else if (state == STOPPED) {
    // Cycle through the resting colors
    stopDimLevel = ((stopDimLevel + 1) % N_DIM_LEVELS);
    Serial.print("setting dim level to ");
    Serial.print(stopDimLevel);
    // Set the lights according to the dim level
    Color color = stopped_color();
    setAllPixels(ring, color.ring);
    setAllPixels(strip, color.strip);
  } else {
    // We're doing something, so stop doing it
    Serial.print("Stop requested\n");
    state = STOPPING;
  }
}

void startTimer() {
  noTone(BUZZER);
  state = RUNNING;
  startTime = millis();
  roundNum = roundNum + 1;
  isSilenced = AUDIBLE;
  Serial.print("Starting round ");
  Serial.print(roundNum);
  Serial.print(" at ");
  Serial.print(DEBUG_SPEEDUP);
  Serial.println("x speed");
}


void stopTimer() {
  roundNum = 0;
  noTone(BUZZER);
  flourish();
  state = STOPPED;
}


void setAllPixels(Adafruit_NeoPixel &pixel, uint32_t c, bool keepBluePin=false)
// Set all the neopixels to the given color
{
  for (uint16_t i=0; i < pixel.numPixels(); i++) {
    pixel.setPixelColor(i, c);
  }
  // Set the 12th pin to blue, for the ring timer
  if (keepBluePin) {
    pixel.setPixelColor(pixel.numPixels()-1, BLUE);
  }
  pixel.show();  
}


void setRingLights(int numOn, uint32_t color)
// Set a certain number of LEDs on the ring to on
{
  for (int i=0; i<numOn; i++) {
    ring.setPixelColor(i, color);
  }
  // Set the remaining LEDs off
  for (int i=numOn; i<N_RING; i++) {
    ring.setPixelColor(i, C_OFF.ring);
  }
  ring.show();
}



uint32_t Wheel(byte WheelPos)
// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
{
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


bool isLongRound(long roundNum) {
  return (roundNum % (SHORT_PER_LONG + 1) == 0);
}


// Determine if the timer is running or on break
char getNewState(unsigned long mSeconds, long roundNum) {
  // Get the new state
  char newState;
  if (state == STOPPED || state == STOPPING || state == STARTING) {
    // We're stopped, so stay stopped.
    newState = state;
  } else if (mSeconds < WORK_SEC * 1000) {
    // User is working normally
    newState = RUNNING;
  } else if (mSeconds < (WORK_SEC + BREAK_SEC) * 1000 && !isLongRound(roundNum)) {
    // User is in a short break
    newState = BREAK;
  } else if (mSeconds < (WORK_SEC + (SHORT_PER_LONG+1) * BREAK_SEC) * 1000 && isLongRound(roundNum)) {
    // User is in a long break
    newState = BREAK;
  } else {
    // Break has ended
    newState = EXPIRED;
  }
  return newState;
}


// Set the number of lights on the timer depending on the number of seconds in we are.
void setTimerLights(unsigned long mSeconds, long roundNum, float workBrightnessAdjust=1.) {
  int pin;
  int effectivePin;
  bool isBreakPin;
  double brightness;
  uint32_t color;
  unsigned long pinOffset = mSeconds / 1000 / 300;
  // Disable the buzzer
  noTone(BUZZER);
  // Set the pins one at a time
  for (pin=0; pin<11; pin++) {
    // Determine the brightness for the pin
    brightness = exp(-pin/4.655);
    // Determine which color to make the pin
    effectivePin = pin + pinOffset;
    // Determine if we're in a break of not
    if (isLongRound(roundNum)) {
      // It's a long break round
      isBreakPin = ((5 <= effectivePin && effectivePin <= 8) || effectivePin == 14);
    } else if (roundNum % (SHORT_PER_LONG + 1) == 3) {
      // It's the round right before a long break round
      isBreakPin = (effectivePin == 5 || (11 <= effectivePin && effectivePin <= 14));
    } else {
      // It's a regular short break round
      isBreakPin = (effectivePin == 5 || effectivePin == 11);
    }
    if (isBreakPin) {
      // Break pixel
      color = ring.Color(0, 255 * brightness, 0); // Green
    } else {
      // Work pixel
      brightness = brightness * workBrightnessAdjust;
      color = ring.Color(255 * brightness, 0, 255 * brightness);
    }
    // Set the actual pin color
    ring.setPixelColor(pin, color);
  }

  // Set the 12 o'clock position to be blue
  ring.setPixelColor(pin, BLUE);
  ring.show();
}


void setWorkLights(unsigned long mSeconds, long roundNum) {
  // Set all the strip lights
  setAllPixels(strip, C_WORK.strip);
  return setTimerLights(mSeconds, roundNum);
}


// Set the number of lights on the timer depending on how long the user is taking a break
void setBreakLights(unsigned long mSeconds, long roundNum) {
  unsigned long breakMillis;
  breakMillis = mSeconds - WORK_SEC * 1000;
  // Check if we should flash the lights
  if (breakMillis / DEBUG_SPEEDUP < 6 * TICK) {
    flashLights(breakMillis, C_REST);
  } else {
    // Display how much break time there is left
    setTimerLights(mSeconds, roundNum, 0.);
    // Set the strip lights to be green
    setAllPixels(strip, C_REST.strip);
  }
}


void setExpiredLights(unsigned long mSeconds) {
  unsigned long expiredMillis = mSeconds - (WORK_SEC + BREAK_SEC) * 1000;
  flashLights(expiredMillis, C_WORK);
}


void flashLights(unsigned long mSeconds, Color color) {
  // Flash to lights to indicate the break has start
  unsigned long numTicks = mSeconds / DEBUG_SPEEDUP / TICK;
  if (numTicks % 2) {
    // Odd tick
    setAllPixels(ring, C_OFF.ring, true);
    setAllPixels(strip, C_OFF.strip, false);
    noTone(BUZZER);
  } else {
    // Even tick
    setAllPixels(ring, color.ring, true);
    setAllPixels(strip, color.strip, false);
    if (isSilenced == AUDIBLE) {
      tone(BUZZER, TONE_HZ);
    }
  }
}


// Function that fluorishes the lights, then waits for the user to press the "Go" button
void flourish() {
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
    strip.setPixelColor(pxIdx, C_OFF.strip);
    // Set the ring LED off
    // pxIdx = N_RING - (i * N_RING / 255) - 1;
    pxIdx = i * N_RING / 255;
    ring.setPixelColor(pxIdx, C_OFF.ring);
    // Update the device and wait for a bit
    strip.show();
    ring.show();
    delay(0.5);
  }
}


void setOffLights() {
  setAllPixels(strip, TEAL.strip, false);
  setAllPixels(ring, TEAL.ring, true);
}


void setStoppedColor(unsigned long mSeconds)
// Set the color of the strip pixels when the timer is stopped
// Only sets pixels when we're in the STOP_DIM color
// (bright white and off still work)
{
  if (stopDimLevel == DIM_LOW) {
    unsigned short base_hue = mSeconds * STOP_COLOR_SPEED;
    uint32_t color;
    unsigned short px_hue, hue;
    
    for (uint16_t i=0; i < strip.numPixels(); i++) {
      px_hue = (i / (float) strip.numPixels()) * 65536;
      hue = base_hue - px_hue;
      color = strip.ColorHSV(hue, 255, 191);
      strip.setPixelColor(i, color);
    }
    strip.show();
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
  attachInterrupt(digitalPinToInterrupt(BTN_START), start_pressed, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN_STOP), stop_pressed, RISING);

  // Set initial state
  lastBtnPress = millis();
  stopTimer();
  stop_pressed();
}

void loop() {

  // Figure out how long we've been working so far
  unsigned long mSecondsIn = (millis() - startTime) * DEBUG_SPEEDUP;

  state = getNewState(mSecondsIn, roundNum);

  // Set the lights appropriately
  if (stopPending) {
    stop_timer();
  } else if (state == STOPPED) {
    setStoppedColor(mSecondsIn);
  //  setAllPixels(strip, c_stopped.strip);
  //  setAllPixels(ring, c_stopped.ring);
  } else if (state == RUNNING) {
    setWorkLights(mSecondsIn, roundNum);
  } else if (state == BREAK) {
    setBreakLights(mSecondsIn, roundNum);
  } else if (state == EXPIRED) {
    setExpiredLights(mSecondsIn);
  } else if (state == STOPPING) {
    stopTimer();
  } else if (state == STARTING) {
    startTimer();
  }

  // Sleep until the next round
  delay(LOOP_TICK);
}
