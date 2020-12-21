// EFI controller based on MAP and Points ONLY
// (C) 2020 John Patterson Consulting, LLC
// You are free to modify and redistribute this code without restriction.


// ----------------- Program constants -----------------:

// Pin numbers:
const int pointsPin = 3;
const int MAPPin = 14;
const int injectorPin = 6;
const int LEDPin = 13;

// Timing constants:
const unsigned long injectorUpdateInterval = 50000;
const unsigned long interruptDebounce = 3000;
const unsigned long primeTime = 500;
const unsigned long pumpTime = 1500;
const int serialReportModulo = 10;
const int RPMrunningAverageDepth = 5;
const unsigned long blinkTime = 250;

// Engine-related constants:
const int pulsesPerRevolution = 2;
const double displacement_Liters = 1.2;
const double AFR = 10.0;    // ~14 for gasoline, ~10 for E85
const double injector_MaxGramsPerMinute = 195.0;  // Will depend on your injector and fuel pressure
const double stallRPM = 300.0;
const double Pascals_Per_ADC_Unit = 122.1;
const int vacuum_ADC_value = 102;

// Physical parameters:
const double airTempKelvin = 273;
const double airMolarMass = 28.9;
const double R_Liter_Pascal_Kelvin = 8314.0;


// ----------------- Global Variables -----------------:
unsigned long updateLastMicros = 0;
unsigned long pointsLastMicros = 0;
unsigned long pointsDiff = 100000000;
bool stalled = 0;
int serialReportCount = 0;
double RPMrunningAverage[RPMrunningAverageDepth];
int RPMrunningAverageIndex = 0;
unsigned long blinkLastMillis = 0;
bool blinkState = 0;

// ----------------- Functions -----------------:

// ISR triggered when the points open:
void points()
{
  //Determine if interrupt is valid based on time since last interrupt:
  if((micros() - pointsLastMicros) > interruptDebounce)
  {
    // Compute difference in time from last points opening:
    pointsDiff = micros() - pointsLastMicros;
    
    // Reset points timer:
    pointsLastMicros = micros();
  }
  
}

// Function to compute RPM based on time since last points opening:
double RPM()
{
  // If pointsDiff is longer than the time since points() was last called,
  // just use pointsDiff to compute the RPM:
  if(pointsDiff > (micros() - pointsLastMicros))
  {
    // RPM = (Pulses/sec)/(Pulses/Revolution)*(60 sec/min)
    RPMrunningAverage[RPMrunningAverageIndex] = (1000000.0/pointsDiff)/pulsesPerRevolution*60.0;
  }
  // If it has been longer than pointsDiff since points() was last called,
  // use the elapsed time to compute the RPM:
  else
  {
    // RPM = (Pulses/sec)/(Pulses/Revolution)*(60 sec/min)
    RPMrunningAverage[RPMrunningAverageIndex] = (1000000.0/(micros() - pointsLastMicros))/pulsesPerRevolution*60.0;
  }

  //Increment running average index, reset if needed:
  RPMrunningAverageIndex++;
  if(RPMrunningAverageIndex >= RPMrunningAverageDepth)
  {
    RPMrunningAverageIndex = 0;
  }

  // Compute running average sum:
  double sum = 0;
  for(int i = 0; i < RPMrunningAverageDepth; i++)
  {
    sum = sum + RPMrunningAverage[i];
  }

  // Return running average of RPM:
  return sum/RPMrunningAverageDepth;
}

// Function to measure the Manifold Absolute Pressure (MAP):
double MAP()
{
  double estimatedMAP = (analogRead(MAPPin) - vacuum_ADC_value)*Pascals_Per_ADC_Unit;

  // Ensure only positive MAP values are returned:
  if(estimatedMAP < 0)
  {
    estimatedMAP = 0;
  }
  
  return estimatedMAP;
}

// Function to report human-readable stats to the serial port:
void reportStats(double RPM_report, double MAP_report, double DC_report)
{
  // Report engine RPM:
  Serial.print("Engine RPM: ");
  Serial.println(RPM_report);
  Serial.print("Manifold Absolute Pressure: ");
  Serial.print("kPa: ");
  Serial.print(MAP_report/1000.0);
  Serial.print(" PSI: ");
  Serial.println(MAP_report/6894.76);
  Serial.print("Injector Duty Cycle: ");
  Serial.print(DC_report*100.0);
  Serial.println("%");
  Serial.println(" ");
}

// Function to compute the required fuel injector duty cycle:
double getInjectorDC()
{
  //Get measurements:
  double RPM_value = RPM();
  double MAP_value = MAP();
  
  // Compute the volume flow rate of air (L/min) into the engine
  // (Otto cycle with 2 revolutions per intake stroke assumed):
  double volFlowRate = displacement_Liters*RPM_value/2.0;

  // Compute the density of air (g/L) using the Ideal Gas Law (PV=nRT):
  // Density = mass/volume = n(airMolarMass)/V = P(airMolarMass)/(RT)
  double airDensity = MAP_value*airMolarMass/(R_Liter_Pascal_Kelvin*airTempKelvin);

  // Compute the mass air flow rate into the engine:
  double massAirFlow = volFlowRate*airDensity;

  // Compute the required mass fuel flow rate into the engine:
  double massFuelFlow = massAirFlow/AFR;

  // Compute the duty cycle for the fuel injector 
  // (based on the maximum fuel delivery rate):
  double estimated_DC = massFuelFlow/injector_MaxGramsPerMinute;

  // Ensure that the duty cycle does not exceed 1 or fall below 0:
  if(estimated_DC > 1.0)
  {
    estimated_DC = 1.0;
  }
  if(estimated_DC < 0)
  {
    estimated_DC = 0;
  }

  // Report human-readable stats every serialReportModulo iterations:
  if(serialReportCount < serialReportModulo)
  {
    serialReportCount++;
  }
  else
  {
    serialReportCount = 0;
    reportStats(RPM_value, MAP_value, estimated_DC);
  }
  
  
  return estimated_DC;
}


// ----------------- Main Program -----------------:

void setup() {
  // Set pin modes:
  pinMode(injectorPin, OUTPUT);
  pinMode(pointsPin, INPUT);
  pinMode(LEDPin, OUTPUT);

  // Attach interrupt for detecting points pulses:
  attachInterrupt(digitalPinToInterrupt(pointsPin), points, FALLING);

  //Start Serial port:
  Serial.begin(115200);
  Serial.println("EFI controller based on MAP and Points ONLY");
  Serial.println("(C) 2020 John Patterson Consulting, LLC");
  Serial.println(" ");

  //Wait for fuel pump to build pressure:
  Serial.println("Waiting for fuel pump...");
  delay(pumpTime);
  Serial.println(" ");

  // Prime engine with some fuel before starting:
  Serial.println("Priming intake...");
  digitalWrite(injectorPin, HIGH);
  delay(primeTime);
  digitalWrite(injectorPin, LOW);
  Serial.println("Priming complete. Ready to crank!");
  Serial.println(" ");
}

void loop() {
  //Determine if the engine is currently stalled:
  stalled = (RPM() < stallRPM);

  // If engine is running, keep LED on and steady:
  if(!stalled)
  {
    digitalWrite(LEDPin, HIGH);
  }
  // If engine is stalled, blink LED:
  else if(millis() - blinkLastMillis > blinkTime)
  {
    blinkLastMillis = millis();
    blinkState = !blinkState;
    digitalWrite(LEDPin, blinkState);
  }
  
 
  // Pulse the injector if it is time to do so:
  if((micros() - updateLastMicros) > injectorUpdateInterval)
  {
    // Reset injector update timer:
    updateLastMicros = micros();

    // Compute fuel injector duty cycle:
    double computed_DC = getInjectorDC();

    // Only dispense fuel if engine is running:
    if(!stalled)
    {
      // Open injector for amount of time specified by duty cycle:
      unsigned long injectorMicros = micros();
      while((micros() - injectorMicros) < (unsigned long)(injectorUpdateInterval*computed_DC))
      {
        digitalWrite(injectorPin, HIGH);
      }

      //Close injector:
      digitalWrite(injectorPin, LOW);
    }
  }

}
