/*
  Tomato Timer

  Creates a countdown timer for staying on track during boring work.

  Exampes usage: work for 25 min, then break for 5,
  then work for 25, etc. Every 4 work periods,
  there is a longer 20 minutes break.

  January 2017
  Mark Wolf
*/

// Durations for each phase (in milliseconds)
// Eg. 5 * 60 * 1000 --> 5 min
#define TICK  400
#define DEBUG_SPEEDUP 1 // Set to 1 for normal operation
#define WORK_TIME 25 * 60 * 1000ul / DEBUG_SPEEDUP
#define BREAK_TIME 5 * 60 * 1000ul / DEBUG_SPEEDUP
#define BREAK_TIME_LONG BREAK_TIME * 4

#define TONE_HZ 100

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
#define RED0 13
#define RED1 11
#define RED2 9
#define RED3 7
#define RED4 5
#define GRN0 12
#define GRN1 10
#define GRN2 8
#define GRN3 6

// Define pins for the red and green LED's
const int N_REDS = 5;
const int RED_PINS[N_REDS] = {RED0, RED1, RED2, RED3, RED4};
const int N_GRNS = 4;
const int GRN_PINS[N_GRNS] = {GRN0, GRN1, GRN2, GRN3};

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

// Function for advancing to the next round of work
void start_next_round() {
  // Flash the lights to indicate the round number
  if (currentRound > 0) {
    sound_buzzer(LOW);
    writeRedPins(LOW);
    writeGreenPins(LOW);
    delay(TICK / 2);
    for (int i=0; i < currentRound; i += 1) {
      sound_buzzer(HIGH);
      writeRedPins(HIGH);
      writeGreenPins(HIGH);
      delay(TICK / 5);
      sound_buzzer(LOW);
      writeRedPins(LOW);
      writeGreenPins(LOW);
      delay(TICK);
    }
    writeRedPins(LOW);
    writeGreenPins(LOW);
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
  // Keep track of state
  isStopped = false;
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


// Function sets all pins in an array
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


// Function that fluorishes the lights, then waits for the user to press the "Go" button
void pauseInit() {
  Serial.print("Pausing init\n");
  // Cycle through the lights
  char pins[] = {RED0, RED1, RED2, RED3, RED4, GRN3, GRN2, GRN1, GRN0};
  int pause = 30;
  for (char i=0; i<9; i++) {
    digitalWrite(pins[i], HIGH);
    delay(pause);
    digitalWrite(pins[i], LOW);
  }
  for (char i=7; i>-1; i--) {
    digitalWrite(pins[i], HIGH);
    delay(pause);
    digitalWrite(pins[i], LOW);
  }

  // Wait for user to press the go button
  while (!btnPressed) {
    delay(100);
  }
}


// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  // initialize digital pin LED_BUILTIN as an output.
  for (int i = 0; i < N_REDS; i++) {
    pinMode(RED_PINS[i], OUTPUT);
  }
  for (int i = 0; i < N_GRNS; i++) {
    pinMode(GRN_PINS[i], OUTPUT);
  }

  // Set the interrupt for when the various buttons are pressed
  // attachInterrupt(digitalPinToInterrupt(MUTE_PIN), mute_buzzer, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN_START), press_button, RISING);
  attachInterrupt(digitalPinToInterrupt(BTN_STOP), stop_pressed, RISING);

  // Start of on the first round
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

  // Set the appropriate LEDs
  int state = currentState();
  
  // Check if the user 
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
    writeGreenPins(LOW);
    // Set the red LEDs
    int n_leds = (runTime) / (WORK_TIME / N_REDS) % N_REDS;
    for (char i=0; i<n_leds; i++) {
      // Unset the lower pins
      digitalWrite(RED_PINS[i], LOW);
    }
    for (char i=n_leds; i<N_REDS; i++) {
      // Set the upper pins
      digitalWrite(RED_PINS[i], HIGH);
    }
  } else if (state == BREAK) {
    writeRedPins(LOW);
    // Just set one green LED
    digitalWrite(GRN3, HIGH);
  } else if (state == LONG_BREAK) {
    // Set the green LEDs
    writeRedPins(LOW);
    // Set the green LEDs
    int n_leds = (runTime - WORK_TIME) / (BREAK_TIME_LONG / N_GRNS) % N_GRNS;
    for (char i=0; i<n_leds; i++) {
      // Unset the lower pins
      digitalWrite(GRN_PINS[i], LOW);
    }
    for (char i=n_leds; i<N_GRNS; i++) {
      // Set the upper pins
      digitalWrite(GRN_PINS[i], HIGH);
    }
  } else if (state == EXPIRED) {
    
    sound_buzzer(tickPhase);
    writeRedPins(tickPhase);
    writeGreenPins(LOW);
  }

  // Check if the buzzer should sound to alert that a break has just started
  if (runTime > WORK_TIME && runTime < WORK_TIME + 6*TICK) {
    sound_buzzer(tickPhase);
  } else if (state != EXPIRED) {
    sound_buzzer(LOW);
  }

  delay(TICK);
}



















