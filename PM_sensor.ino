// This file is part of Air Quality Monitor.
//
// Air Quality Monitor is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Air Quality Monitor is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Air Quality Monitor.  If not, see
// <https://www.gnu.org/licenses/>.

#include "common_defines.h"

// Setup PM sensor
void setupPMsensor() {
  pinMode(PM_SENSOR_SLEEP, OUTPUT);
  digitalWrite(PM_SENSOR_SLEEP, HIGH);
  PMSerial.begin(9600);
  PMSerial.setTimeout(1500);
}

// Extracts the PM 1.0 value from the sensor buffer.
int extractPM01(unsigned char *thebuf) {
  int PM01Val;
  PM01Val = ((thebuf[3] << 8) + thebuf[4]);
  return PM01Val;
}

// Extracts the PM 2.5 value from the sensor buffer.
int extractPM2_5(unsigned char *thebuf) {
  int PM2_5Val;
  PM2_5Val = ((thebuf[5] << 8) + thebuf[6]);
  return PM2_5Val;
}

// Extracts the PM 10 value from the sensor buffer.
int extractPM10(unsigned char *thebuf) {
  int PM10Val;
  PM10Val = ((thebuf[7] << 8) + thebuf[8]);
  return PM10Val;
}

// Verifies the checksum of the data received by the sensor.
// Details in the sensor datasheet.
char validatePMCheckSum(unsigned char *thebuf, char leng) {
  char receiveflag = 0;
  int receiveSum = 0;
  for (int i = 0; i < (leng - 2); i++) {
    receiveSum = receiveSum + thebuf[i];
  }
  receiveSum = receiveSum + 0x42;
  if (receiveSum ==
      ((thebuf[leng - 2] << 8) + thebuf[leng - 1])) {
    receiveSum = 0;
    receiveflag = 1;
  }
  return receiveflag;
}

bool readPMValues() {

  if (config_data_.pm_dc_mode == PM_SENSOR_ALWAYS_OFF) {
    return false;
  }
  #ifdef SERIAL_DEBUG
  Serial.print("OFF Time ");
  Serial.print(state_.pm_off_time);
  Serial.print(" -- ON time ");
  Serial.print(state_.pm_on_time);
  Serial.print(" -- Current time ");
  Serial.println(millis());
  #endif

  if (config_data_.pm_dc_mode == PM_SENSOR_15M && state_.pm_active && state_.pm_off_time < millis()) {
    #ifdef SERIAL_DEBUG
      Serial.print("Deactivating sensor");
    #endif
    digitalWrite(PM_SENSOR_SLEEP, LOW);
    state_.pm_active = false;
    state_.pm_on_time = millis() + PM_INACTIVE_TIMEOUT_MS;
    if (config_data_.fan_mode == FAN_MODE_PM_SYNC) {
      state_.fan_active = false;
      state_.fan_on_time = state_.pm_on_time;
      digitalWrite(FAN_CONTROL_PIN, HIGH);
    }
    return false;
  }

  if (config_data_.pm_dc_mode == PM_SENSOR_15M && !state_.pm_active && state_.pm_on_time < millis()) {
    #ifdef SERIAL_DEBUG
      Serial.print("Activating sensor");
    #endif
    digitalWrite(PM_SENSOR_SLEEP, HIGH);
    state_.pm_active = true;
    state_.pm_off_time = millis() + PM_ACTIVE_TIMEOUT_MS;
    if (config_data_.fan_mode == FAN_MODE_PM_SYNC) {
      state_.fan_active = true;
      state_.fan_off_time = state_.pm_off_time;
      digitalWrite(FAN_CONTROL_PIN, LOW);
    }
    // Return false anyway to give sensor a bit of warmup.
    return false;
  }
  // First byte of the received sequence is a fixed 0x42 followed by 0x4d
  // see sensor datasheet for reference.
  if (PMSerial.find(0x42)) {
    PMSerial.readBytes(pm_serial_buf, PM_PACKET_LEN);
    if (pm_serial_buf[0] == 0x4d) {
      if (validatePMCheckSum(pm_serial_buf, PM_PACKET_LEN)) {
        aq_data_.PM1Value = extractPM01(pm_serial_buf);
        aq_data_.PM2_5Value = extractPM2_5(pm_serial_buf); //count PM2.5 value of the air detector module
        aq_data_.PM10Value = extractPM10(pm_serial_buf); //count PM10 value of the air detector module
        maybePublishPMValues(aq_data_.PM1Value, aq_data_.PM2_5Value, aq_data_.PM10Value);
        return true;
      }
    }
  }
  return false;
}
