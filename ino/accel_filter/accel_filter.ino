/* This example reads the raw values from the L3GD20H gyro and
LSM303D accelerometer and magnetometer on the Zumo 32U4, and
prints those raw values to the serial monitor.

The accelerometer readings can be converted to units of g using
the conversion factors specified in the "Sensor characteristics"
table in the LSM303 datasheet.  The default full-scale (FS)
setting is +/- 2 g, so the conversion factor is 0.61 mg/LSB
(least-significant bit).  A raw reading of 16384 would correspond
to 1 g.

The gyro readings can be converted to degrees per second (dps)
using the "Mechanical characteristics" table in the L3GD20H
datasheet.  The default sensitivity is 8.75 mdps/LSB
(least-significant bit).  A raw reading of 10285 would correspond
to 90 dps.

The magnetometer readings are more difficult to interpret and
will usually require calibration. */

#include <Wire.h>
#include <Zumo32U4.h>
Zumo32U4Motors motors;
LSM303 compass;
L3G gyro;

char report[120];
int old_acc_x;
float acc_x;
float ratio = 0.4;
void setup()
{
  Wire.begin();

  if (!compass.init())
  {
    // Failed to detect the compass.
    ledRed(1);
    while(1)
    {
      Serial.println(F("Failed to detect the compass."));
      delay(100);
    }
  }

  compass.enableDefault();

  if (!gyro.init())
  {
    // Failed to detect the gyro.
    ledRed(1);
    while(1)
    {
      Serial.println(F("Failed to detect gyro."));
      delay(100);
    }
  }

  gyro.enableDefault();
  compass.read();
  old_acc_x = compass.a.x;

}

void loop()
{
  motors.setLeftSpeed(300); 
 delay(2);
  motors.setRightSpeed(300);
 delay(2);

  compass.read();
  gyro.read();
  acc_x = (acc_x*(1-ratio) + (float) compass.a.x*ratio);
  
  Serial.print(int (acc_x));
 //Serial.print(compass.a.x);
  
  //snprintf_P(report, sizeof(report), PSTR("accel: %6d Filter Accel: %6d "),(compass.a.x ),(int) (acc_x ));
  //snprintf_P(report, sizeof(report), PSTR("%6d"),(acc_x));
  Serial.println(report);

  delay(100);
}
