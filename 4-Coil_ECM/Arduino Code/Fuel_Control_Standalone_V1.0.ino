// Standalone Fuel Injection Controller for 4-Coil PCB Series
// Part of the Power Buggy ECM system.
// (C) 2021 John Patterson Consulting, LLC
// You are free to modify and redistribute this code without restriction.

// ----------------- Program constants -----------------:

// Pin numbers:
const int pointsPinA = 19;                                // Pin number for distributor points signal.
const int pointsPinB = 10;                                // Pin number for distributor points signal.
const int coilPin = 7;                                  // Pin number for ignition coil transistor.
const int injectorPin = 6;                              // Pin number for fuel injection transistor.
const int auxPin = 8;                                   // Pin number for auxiliary transistor.
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

// Ignition measurement parameters:
const bool useFallingEdge = 0;                          // Indicates whether to use rising or falling edge to detect points timing.
const double RevLimiter = 4500;                         // Rev limiter RPM speed (for indication only in Fuel Controller)

// Fuel injection parameters:
const unsigned long injectorUpdateInterval = 30000;     // How frequently (us) the fuel injectors should be cycled.
const unsigned long primeTime = 80;                     // How long to initially supply fuel when program is first initialized.
const unsigned long pumpTime = 250;                     // How long to wait for fuel pump to build pressure when program is first initialized.
const unsigned long blinkTime = 250;                    // LED status indicator blinking time (ms).
const unsigned long richStartupTime = 10000;            // How long (ms) the minimim idle duty cycle should use the initial startup value.
const double displacement_Liters = 1.776;               // Engine sidplacement (in liters).
const double injector_MaxGramsPerMinute = 690;          // Amount of fuel that fuel injector can supply (grams per minute) at given fuel pressure.
const double stallRPM = 100.0;                          // Minimum engine speed above which fuel will be dispensed.
const double min_DC_running = 0.025;                    // Minimum fuel injector duty cycle allowed while engine is running (for smoother idling).
const double min_DC_startup = 0.035;                    // Minimum fuel injector duty cycle allowed while engine is running during initial startup (for easier starting).
const double min_safe_OnTime = 2000;                    // Minimum safe injector on-time (us) to prevent failure to open (stall-out)                         
const double vacuum_ROC_Multiplier = 0.000000000;       // Amount of additional injector duty cycle to apply in response to increasing manifold pressure (per pascal).
const double vacuum_ROC_Cut_In = 51710;                 // Minimum manifold pressure (Pa) above which vacuum rate-of-change fuel addition will be applied.
const double airTempKelvin = 298;                       // Assumed air temperature (in Kelvin).
const double airMolarMass = 28.9;                       // Assumed molar mass of air (20% oxygen, 80% nitrogen).
const double R_Liter_Pascal_Kelvin = 8314.0;            // Ideal gas constant (Pascals and Kelvin).
const double fuel_comp = 1.0;                           // AFR compensation for fuels other than gasoline (for example, E85).

// ----------------- Global Variables -----------------:
double min_DC = min_DC_startup;                         // Minimum duty cycle for fuel injectors.
unsigned long pointsLastMicros = 0;                     // Timestamp of last recorded points triggering.
unsigned long pointsDiff = 100000000;                   // Difference in time from the last points triggering.
unsigned long injectorOnTimeMicros = 0;                 // Timestamp of injector turn-on.
unsigned long injectorOffTimeMicros = 0;                // Timestamp of injector turn-off.
unsigned long injectorOnDelay = 0;                      // Calculated ON time target for fuel injector.
unsigned long injectorOffDelay = 0;                     // Calculated OFF time target for fuel injector.
bool injectorOn = 0;                                    // Flag to indicate if fuel injector is currently in the ON state.
unsigned long blinkLastMillis = 0;                      // Timestamp of last recorded LED blink.
bool blinkState = 0;                                    // State of status LED.
int RPMrunningAverageIndex = 0;                         // Index of running average value being edited.
bool lastPointsStateA = 0;                               // Last recorded value of the points input source (Bank A).
bool lastPointsStateB = 0;                               // Last recorded value of the points input source (Bank B).
double engineRPM = 0;                                   // Measured speed of the engine (RPM).
double enginePressure = 0;                              // Measured manifold pressure (Pa).
double engineVacuum = 0;                                // Calculated manifold vacuum level (Pa).
double engineAFR = 0;                                   // Target Air-Fuel Ratio from lookup table.
double engineDC = 0;                                    // Duty cycle to be applied to the fuel injectors.
double vacROC = 0;                                      // Calculated vacuum rate-of-change.
double delayAngle = 0;                                  // Calculated delay angle for spark timing.
unsigned long delayTime = 0;                            // Calculated delay time (us) for spark timing.
unsigned long lastMAP = 0;                              // Last-measured MAP pressure.
bool stalled = 0;                                       // Engine stalled state flag.

// ----------------- AFR Tables -----------------:
// John's 1776 tune:
// PSI:                   0-1.5   1.5-3   3-4.5   4.5-6   6-7.5   7.5-9   9-10.5  10.5-12 12-13.5  13.5-15
double AFR_500RPM[10] =  {12.000, 12.000, 12.000, 12.000, 12.000, 12.000, 11.000, 11.000, 11.000, 11.000};
double AFR_1000RPM[10] = {12.000, 13.000, 13.000, 13.000, 13.000, 12.000, 12.000, 12.000, 11.000, 11.000};
double AFR_1500RPM[10] = {12.000, 13.000, 13.000, 13.000, 13.000, 13.000, 12.000, 12.000, 12.000, 11.000};
double AFR_2000RPM[10] = {14.000, 14.000, 14.000, 14.000, 13.000, 12.000, 12.000, 12.000, 12.000, 11.000};
double AFR_2500RPM[10] = {14.000, 14.000, 14.000, 13.000, 13.000, 12.000, 12.000, 12.000, 12.000, 11.000};
double AFR_3000RPM[10] = {14.000, 14.000, 14.000, 13.000, 13.000, 12.000, 12.000, 12.000, 12.000, 11.000};
double AFR_3500RPM[10] = {14.000, 14.000, 13.000, 13.000, 12.000, 12.000, 12.000, 12.000, 12.000, 11.000};
double AFR_4000RPM[10] = {14.000, 14.000, 13.000, 13.000, 13.000, 12.000, 12.000, 12.000, 12.000, 11.000};
double AFR_4500RPM[10] = {14.000, 14.000, 13.000, 13.000, 13.000, 13.000, 12.000, 12.000, 11.000, 11.000};
double AFR_5000RPM[10] = {14.000, 14.000, 13.000, 13.000, 13.000, 13.000, 12.000, 11.000, 11.000, 11.000};



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


// Function to check if points/sensors have been triggered (2 sensors):
bool checkPoints_2x()
{
  // Measure state of sensors for coil Bank A and Bank B:
  bool pointsStateA = digitalRead(pointsPinA);
  bool pointsStateB = digitalRead(pointsPinB);

  // If falling edge is selected, evaluate if this type of transistion has occurred:
  if(useFallingEdge)
  {
    // Trigger on falling edge:
    // Check Bank A:
    if(!pointsStateA && lastPointsStateA)
    {
      lastPointsStateA = pointsStateA;
      return 1;
    }
    // Trigger on falling edge:
    // Check Bank B:
    if(!pointsStateB && lastPointsStateB)
    {
      lastPointsStateB = pointsStateB;
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
      return 1;
    }
    // Trigger on rising edge:
    // Check Bank B:
    if(pointsStateB && !lastPointsStateB)
    {
      lastPointsStateB = pointsStateB;
      return 1;
    }
  }

  // If no relevant transition has occurred, return 0:
  lastPointsStateA = pointsStateA;
  lastPointsStateB = pointsStateB;
  return 0;
}

// Function to obtain AFR target:
double AFR_Reporting()
{
  // Determine index of MAP pressure in AFR table to use:
  int MAP_index = 0;
  
  if(enginePressure < 10342.1)
  {
    MAP_index = 0;
  }
  else if(enginePressure < 20684.3)
  {
    MAP_index = 1;
  }
  else if(enginePressure < 31026.4)
  {
    MAP_index = 2;
  }
  else if(enginePressure < 41368.5)
  {
    MAP_index = 3;
  }
  else if(enginePressure < 51710.7)
  {
    MAP_index = 4;
  }
  else if(enginePressure < 62052.8)
  {
    MAP_index = 5;
  }
  else if(enginePressure < 72394.95)
  {
    MAP_index = 6;
  }
  else if(enginePressure < 82737.1)
  {
    MAP_index = 7;
  }
  else if(enginePressure < 93079.22)
  {
    MAP_index = 8;
  }
  else
  {
    MAP_index = 9;
  }
  
  // Determine RPM range to use and return relevant AFR:
  if(engineRPM < 500)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(0));
    return AFR_500RPM[MAP_index];
  }
    else if(engineRPM < 1000)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(1));
    return AFR_1000RPM[MAP_index];
  }
  else if(engineRPM < 1500)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(2));
    return AFR_1500RPM[MAP_index];
  }
  else if(engineRPM < 2000)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(3));
    return AFR_2000RPM[MAP_index];
  }
  else if(engineRPM < 2500)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(4));
    return AFR_2500RPM[MAP_index];
  }
  else if(engineRPM < 3000)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(5));
    return AFR_3000RPM[MAP_index];
  }
  else if(engineRPM < 3500)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(6));
    return AFR_3500RPM[MAP_index];
  }
  else if(engineRPM < 4000)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(7));
    return AFR_4000RPM[MAP_index];
  }
  else if(engineRPM < 4500)
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(8));
    return AFR_4500RPM[MAP_index];
  }
  else
  {
    // Report pressure and RPM ranges to serial port in compact format:
    Serial.println(String(MAP_index) + String(9));
    return AFR_5000RPM[MAP_index];
  }
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to update vacuum rate-of-change:
void updateVacROC()
{
  // Compute updated vacuum rate-of-change value:
  vacROC = ((double)enginePressure - (double)lastMAP);
  lastMAP = enginePressure;
  
  // Ensure that ROC is only applied if it is positive:
  if(vacROC < 0)
  {
    vacROC = 0;
  }
}

// ---------------------------------------------------------------------------------------------------------------------
// Function to compute the required fuel injector duty cycle:
double getInjectorDC()
{
  // Compute the volume flow rate of air (L/min) into the engine
  // (Otto cycle with 2 revolutions per intake stroke assumed):
  double volFlowRate = displacement_Liters*engineRPM/2.0;

  // Compute the density of air (g/L) using the Ideal Gas Law (PV=nRT):
  // Density = mass/volume = n(airMolarMass)/V = P(airMolarMass)/(RT)
  double airDensity = enginePressure*airMolarMass/(R_Liter_Pascal_Kelvin*airTempKelvin);

  // Compute the mass air flow rate into the engine:
  double massAirFlow = volFlowRate*airDensity;
  
  // If MAP is above threshold, apply vacuum rate-of-change factor:
  if(enginePressure > vacuum_ROC_Cut_In)
  {
    engineAFR = engineAFR - vacuum_ROC_Multiplier*vacROC;
  }
  // Otherwise, just use AFR from the table directly.

  // Apply fuel compensator (for E51, E85, etc.)
  engineAFR = fuel_comp*engineAFR;

  // Compute the required mass fuel flow rate into the engine:
  double massFuelFlow = massAirFlow/engineAFR;

  // Compute the duty cycle for the fuel injector 
  // (based on the maximum fuel delivery rate):
  double estimated_DC = massFuelFlow/injector_MaxGramsPerMinute;

  // Ensure that the duty cycle does not exceed 1 or fall below the minimum duty cycle value:
  if(estimated_DC > 1.0)
  {
    estimated_DC = 1.0;
  }
  if(estimated_DC < min_DC)
  {
    estimated_DC = min_DC;
  }

  // Return final calculated duty cycle:
  return estimated_DC;
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
  pinMode(injectorPin, OUTPUT);
  pinMode(coilPin, OUTPUT);
  pinMode(auxPin, OUTPUT);
  pinMode(redlineLEDPin, OUTPUT);
  pinMode(statusLEDPin, OUTPUT);

  // Start Serial port:
  Serial.begin(115200);
  Serial.println("Welcome to POWER BUGGY engine control diagnostics!");
  Serial.println(" ");

  // Wait for fuel pump to build pressure:
  Serial.println("Waiting for fuel pump...");
  // Test the "aux" pin:
  digitalWrite(auxPin, HIGH);
  delay(pumpTime);
  digitalWrite(auxPin, LOW);
  Serial.println(" ");

  // Prime engine with some fuel before starting:
  Serial.println("Priming intake...");
  digitalWrite(injectorPin, HIGH);
  delay(primeTime);
  digitalWrite(injectorPin, LOW);
  Serial.println("Priming complete. Ready to crank!");
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
  }

  // Check if engine is stalled:
  checkStalled();

  // If injectors are ON, check if sufficient time has passed to turn them OFF:
  if(injectorOn && (micros() - injectorOnTimeMicros > injectorOnDelay))
  {
    // Turn OFF injectors:
    injectorOn = 0;
    digitalWrite(injectorPin, LOW);
    injectorOffTimeMicros = micros();

    // Compute latest engine RPM:
    engineRPM = RPM();

    // Measure MAP pressure and compute vacuum level, and update vacuum rate-of-change::
    enginePressure = MAP();
    engineVacuum = atmospherePascals - enginePressure;
    updateVacROC();

    // Perform AFR lookups and delay calculations while coil is firing:
    engineAFR = AFR_Reporting();
    engineDC = getInjectorDC();
    injectorOnDelay = (unsigned long)((double)injectorUpdateInterval*engineDC);
    injectorOffDelay = (unsigned long)((double)injectorUpdateInterval*(1-engineDC));

    // Ensure minimum safe on-time is respected:
    if(injectorOnDelay < min_safe_OnTime)
    {
      // Force injector on-time delay to minimum safe value:
      injectorOnDelay = min_safe_OnTime;

      // Compensate injector off-time to achieve required duty cycle:
      injectorOffDelay = ((unsigned long)(((double)min_safe_OnTime)/engineDC) - min_safe_OnTime);
    }

    // Check if startup rich idle timer has ended:
    if(millis() > richStartupTime)
    {
      min_DC = min_DC_running;
    }
  }

  // If injectors are OFF, check if sufficient time has passed to turn them ON:
  if(!injectorOn && ((micros() - injectorOffTimeMicros) > injectorOffDelay))
  {
    injectorOn = 1;
    // Turn ON injectors (if engine is not stalled):
    digitalWrite(injectorPin, !stalled);
    injectorOnTimeMicros = micros();
   
  }

  // Check rev limiter for LED;
  if(engineRPM > RevLimiter)
  {
    // Illuminate rev limiter LED if rev limiter is exceeded:
    digitalWrite(redlineLEDPin, HIGH);
  }
  
}
