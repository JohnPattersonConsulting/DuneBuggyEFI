// 4-Coil Wasted Spark Controller for HEI Coils
// Implements one-coil-per-cylinder ignition with 2 timing sensors.
// Spark is fired at the very end of compression stroke and at the very end of exhaust stroke.
// Implements optional centrifugal and vacuum advance.
// Version 1.0 (beta)
// (C) 2022 John Patterson Consulting, LLC
// You are free to modify and redistribute this code without restriction.

// ----------------- Program constants -----------------:

// Pin numbers:
const int pointsPin_BankA = 19;                          // Pin number for distributor sensor bank A signal.
const int pointsPin_BankB = 10;                          // Pin number for distributor sensor bank B signal.
const int coilPin_BankA = 7;                            // Pin number for ignition coil bank A transistors.
const int coilPin_BankB = 9;                            // Pin number for ignition coil bank B transistors.
const int redlineLEDPin = 12;                           // Pin number for redline indicator LED.
const int statusLEDPin = 13;                            // Pin number for status indicator LED.
const int A0Pin = 14;                                   // Pin number for analog input 0 (MAP sensor).
const int A1Pin = 15;                                   // Pin number for analog input 1.
const int A2Pin = 16;                                   // Pin number for analog input 2.
const int A3Pin = 17;                                   // Pin number for analog input 3.

// Sensor parameters:
const int pulsesPerRevolution = 2;                      // Number of points pulses per engine rotation.
const double Pascals_Per_ADC_Unit = 122.1;              // Number of pascals of MAP pressure per ADC integer unit.
const int vacuum_ADC_value = 102;                       // Zero-out value for the MAP sensor at full vacuum.
const double atmospherePascals = 101000.0;              // Asumed atmospheric pressure (Pa) for vacuum advance calculations.

// Ignition timing parameters:
const unsigned long coilDwellTime = 1000;               // Amount of time (us) to charge the ignition coil.
const unsigned long programDelayTime = 200;             // Ignition compensation time for program execution delays (us).
const bool useFallingEdge = 0;                          // Indicates whether to use rising or falling edge to detect timing.
//const double degreesAdvancePerRPM = 0.0005;
const double degreesAdvancePerRPM = 0.0;                // Amount of centrifugal advance (degrees per RPM) to apply to the timing.
const double degreesAdvancePerPascal = 0.0;
//const double degreesAdvancePerPascal = -0.000015;     // Amount of vacuum advance (degrees per pascal) to apply to the timing.
//const double degreesAdvancePerPascal = 0.00001;
const double RevLimiter = 4500;                         // Rev limiter RPM speed, above which spark is interrupted.
const double vacuumAdvanceMinimumSpeed = 1000.0;        // Minimum RPM above which vacuum advance is applied (to assist starting).
const double initialTiming = 27.0;                      // Amount of extra distributor advance (degrees) applied, into which program will add delays.
const unsigned long blinkTime = 250;                    // LED status indicator blinking time (ms).
const double stallRPM = 100.0;                          // Minimum engine speed above which engine is considered running.


// ----------------- Global Variables -----------------:
unsigned long pointsLastMicros = 0;                     // Timestamp of last recorded points triggering.
unsigned long pointsDiff = 100000000;                   // Difference in time from the last points triggering.
unsigned long coilDelayTimeMicros = 0;                  // Timestamp when coil is called to fire.
bool coilDelayWaiting = 0;                              // Flag to indicate if coil is currently waiting to fire.
unsigned long coilOnTimeMicros = 0;                     // Timestamp of coil turn-on.
bool coilOn = 0;                                        // Flag to indicate if coil is currently in the ON state.
unsigned long blinkLastMillis = 0;                      // Timestamp of last recorded LED blink.
bool blinkState = 0;                                    // State of status LED.
int RPMrunningAverageIndex = 0;                         // Index of running average value being edited.
bool lastPointsStateA = 0;                              // Last recorded value of the distributor input source for coil bank A.
bool lastPointsStateB = 0;                              // Last recorded value of the distributor input source for coil bank B.
double engineRPM = 0;                                   // Measured speed of the engine (RPM).
double enginePressure = 0;                              // Measured manifold pressure (Pa).
double engineVacuum = 0;                                // Calculated manifold vacuum level (Pa).
double delayAngle = 0;                                  // Calculated delay angle for spark timing.
unsigned long delayTime = 0;                            // Calculated delay time (us) for spark timing.
unsigned long lastMAP = 0;                              // Last-measured MAP pressure.
bool stalled = 0;                                       // Engine stalled state flag.
bool fireBankA = 0;                                     // Flag to indicate whether to fire coil bank A or coil bank B.


// ----------------- Program Functions -----------------:

// ---------------------------------------------------------------------------------------------------------------------
// Function to compute RPM based on time since last points opening:
double RPM()
{
  // If pointsDiff is longer than the time since points() was last called,
  // just use pointsDiff to compute the RPM:
  if(pointsDiff > (micros() - pointsLastMicros))
  {
    // RPM = (Pulses/sec)/(Pulses/Revolution)*(60 sec/min)
    return (1000000.0/pointsDiff)/pulsesPerRevolution*60.0;
  }
  // If it has been longer than pointsDiff since points() was last called,
  // use the elapsed time to compute the RPM:
  else
  {
    // RPM = (Pulses/sec)/(Pulses/Revolution)*(60 sec/min)
    return (1000000.0/(micros() - pointsLastMicros))/pulsesPerRevolution*60.0;
  }
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to measure the Manifold Absolute Pressure (MAP):
double MAP()
{
  double estimatedMAP = (analogRead(A0Pin) - vacuum_ADC_value)*Pascals_Per_ADC_Unit;
  // Ensure only positive MAP values are returned:
  if(estimatedMAP < 0)
  {
    estimatedMAP = 0;
  }
  
  return estimatedMAP;
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to calculate how long to delay spark ignition timing:
unsigned long timeToFire()
{
  // Initialize delay angle to base distributor advance:
  delayAngle = initialTiming;

  // Subtract coil dwell time and program delay time from timing delay:
  delayAngle = delayAngle - ((coilDwellTime + programDelayTime)/1000000.0)/(60.0/engineRPM)*360.0;
  
  // Subtract centrifugal advance from delay:
  delayAngle = delayAngle - degreesAdvancePerRPM*engineRPM;

  // Subtract vacuum advance from delay if RPM exceeds vacuumAdvanceMinimumSpeed:
  if(engineRPM > vacuumAdvanceMinimumSpeed)
  {
    delayAngle = delayAngle - degreesAdvancePerPascal*engineVacuum;
  }

  // Ensure timing delay does not go below zero:
  if(delayAngle < 0.0)
  {
    delayAngle = 0.0;
  }

  // Convert degrees of timing delay to microseconds:
  unsigned long timeToFireMicros = (unsigned long)((delayAngle/360.0)*(60.0/engineRPM)*1000000);

  return timeToFireMicros;
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to check if points/sensors have been triggered (2 sensors):
bool checkPoints_2x()
{
  // Measure state of sensors for coil Bank A and Bank B:
  bool pointsStateA = digitalRead(pointsPin_BankA);
  bool pointsStateB = digitalRead(pointsPin_BankB);

  // If falling edge is selected, evaluate if this type of transistion has occurred:
  if(useFallingEdge)
  {
    // Trigger on falling edge:
    // Check Bank A:
    if(!pointsStateA && lastPointsStateA)
    {
      lastPointsStateA = pointsStateA;
      fireBankA = 1;
      return 1;
    }
    // Trigger on falling edge:
    // Check Bank B:
    if(!pointsStateB && lastPointsStateB)
    {
      lastPointsStateB = pointsStateB;
      fireBankA = 0;
      return 1;
    }
  }
  else
  // If rising edge is selected, evaluate if this type of transistion has occurred:
  {
    // Trigger on rising edge:
    // Check Bank A:
    if(pointsStateA && !lastPointsStateA)
    {
      lastPointsStateA = pointsStateA;
      fireBankA = 1;
      return 1;
    }
    // Trigger on rising edge:
    // Check Bank B:
    if(pointsStateB && !lastPointsStateB)
    {
      lastPointsStateB = pointsStateB;
      fireBankA = 0;
      return 1;
    }
  }

  // If no relevant transition has occurred, return 0:
  lastPointsStateA = pointsStateA;
  lastPointsStateB = pointsStateB;
  return 0;
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to check rev limiter and fire coil banks (2 coil banks):
void fireCoil_2x()
{
  // Start coil ON timer if rev limiter is not exceeded:
  if(engineRPM < RevLimiter)
  {
    // Turn on requested coil bank and begin timer:
    coilOn = 1;
    coilOnTimeMicros = micros();
    // Decide between coil bank A or coil bank B:
    digitalWrite(coilPin_BankA, fireBankA);
    digitalWrite(coilPin_BankB, !fireBankA);
    
    // De-Illuminate rev limiter LED if rev limiter is not exceeded:
    digitalWrite(redlineLEDPin, LOW);
  }
  else
  {
    // Illuminate rev limiter LED if rev limiter is exceeded:
    digitalWrite(redlineLEDPin, HIGH);
  }
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to detect if engine is stalled:
void checkStalled()
{
  //Determine if the engine is currently stalled:
  stalled = (engineRPM < stallRPM);
  
  // If engine is running, keep LED on and steady:
  if(!stalled)
  {
    digitalWrite(statusLEDPin, HIGH);
  }
  // If engine is stalled, blink LED:
  else if(millis() - blinkLastMillis > blinkTime)
  {
    blinkLastMillis = millis();
    blinkState = !blinkState;
    digitalWrite(statusLEDPin, blinkState);
  }
}

// ---------------------------------------------------------------------------------------------------------------------
// Arduino startup function (runs once at program startup):
void setup() {
  // Set pin modes:
  pinMode(coilPin_BankA, OUTPUT);
  pinMode(coilPin_BankB, OUTPUT);
  pinMode(redlineLEDPin, OUTPUT);
  pinMode(statusLEDPin, OUTPUT);

  // Start Serial port:
  Serial.begin(115200);
  Serial.println("Welcome to POWER BUGGY engine control diagnostics!");
  Serial.println(" ");

  // Provide information about how serial reporting works when engine is running:
  Serial.println("AFR table coordinates will be reported during ignition.");
  Serial.println("Format: [MAP 0-9][RPM 0-9]");
  Serial.println(" ");
  
}

// ---------------------------------------------------------------------------------------------------------------------
// Arduino loop function (runs over and over again):
void loop() {
  // Check if points have been triggered:
  if(checkPoints_2x())
  {
    // Reset points timer to update RPM measurement accurately:
    pointsDiff = micros() - pointsLastMicros;
    pointsLastMicros = micros();
    
    // Calculate how long to wait before firing HEI coil:
    delayTime = timeToFire();

    // Start coil firing timer:
    coilDelayTimeMicros = micros();
    coilDelayWaiting = 1;
  }

  // Check if it is time to fire the coil bank:
  if(coilDelayWaiting && (micros() - coilDelayTimeMicros > delayTime))
  {
    // Reset waiting flag:
    coilDelayWaiting = 0;
    
    // Check rev limiter and fire coil:
    fireCoil_2x();
  }

  // Compute latest engine RPM:
  engineRPM = RPM();

  // Measure MAP pressure and compute vacuum level:
  enginePressure = MAP();
  engineVacuum = atmospherePascals - enginePressure;

  // If coil is ON, check if sufficient time has passed to turn it OFF:
  if(coilOn && (micros() - coilOnTimeMicros > coilDwellTime))
  {
    // Turn OFF coil (make spark):
    coilOn = 0;
    digitalWrite(coilPin_BankA, LOW);
    digitalWrite(coilPin_BankB, LOW);
  }

  // Check if engine is stalled:
  checkStalled();
  
}
