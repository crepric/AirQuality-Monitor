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

// Source of PM sensor code:
//******************************
//*Abstract: Read value of PM1,PM2.5 and PM10 of air quality
//*Product Link: https://www.dfrobot.com.cn/goods-1113.html
//*Version：V3.1
//*Author：Zuyang @ HUST
//*Date：March.25.2016
//******************************

// References:
// DHT22 Temp/Hum sensor: https://www.instructables.com/id/How-to-use-DHT-22-sensor-Arduino-Tutorial/
// LCD shield: https://www.osepp.com/electronic-modules/shields/45-16-2-lcd-display-keypad-shield
// PM Laser sensor: https://wiki.dfrobot.com/PM2.5_laser_dust_sensor_SKU_SEN0177

#include "common_defines.h"

void setup() {
#ifdef SERIAL_DEBUG
  Serial.begin(9600);
#endif
  // Read from EPROM the config values, and set them accordingly.
  setConfigsFromEprom();

  // Setup sensors
  dht.begin();
  setupPMsensor();

  setupLCD();

  // Start timer reading button presses
  CurieTimerOne.start(BTN_CHECK_INTERVAL_MS, &timerIsr);

  // Setup the Bluetooth metrics.
  setupBLE();
}

// Timer interrupt used to check for button presses.
// Doing so with an interrupt allows for responsiveness even
// when the microcontroller is busy with readings
void timerIsr() {
  int lcd_key = read_LCD_buttons();
  if (lcd_key == btnNONE) {
    return;
  }
  if (config_data.lcd_bl_mode == LCD_BL_5S) {
    digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
    // This will only matter if mode is 5s;
    state.lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
  }
  switch (lcd_key) {
    case btnDOWN:
      first_line_offset = mod(first_line_offset + 1,
                              visualization_line_counts[config_data.visualization]);
      break;
    case btnUP:
      first_line_offset = mod( first_line_offset - 1,
                               visualization_line_counts[config_data.visualization]);
      break;
    case btnRIGHT:
      config_data.visualization = (Views) mod(config_data.visualization + 1,
                          VISUALIZATION_COUNT);
      first_line_offset = 0;
      break;
    case btnLEFT:
      config_data.visualization = (Views) mod(config_data.visualization - 1,
                          VISUALIZATION_COUNT);
      first_line_offset = 0;
      break;
    case btnSELECT:
      if (config_data.visualization == VISUALIZATION_CONFIGS) {
        state.select_pressed = true;
      }
    case btnNONE:
      break;
  }
}

// Read the buttons.
int read_LCD_buttons() {
  int adc_key_in = analogRead(0);
  if (adc_key_in >= 1020) return btnNONE;
  if (adc_key_in < 50)   return btnRIGHT;
  if (adc_key_in < 250)  return btnUP;
  if (adc_key_in < 500)  return btnDOWN;
  if (adc_key_in < 700)  return btnLEFT;
  if (adc_key_in < 1020)  return btnSELECT;
  return btnNONE;  // when all others fail, return this...
}

#ifdef SERIAL_DEBUG
void printToSerial() {
  if (state.pm_active) {
    Serial.print("PM1.0: ");
    Serial.print(aq_data.PM1Value);
    Serial.println(" ug/m3");

    Serial.print("PM2.5: ");
    Serial.print(aq_data.PM2_5Value);
    Serial.println("  ug/m3");

    Serial.print("PM10 : ");
    Serial.print(aq_data.PM10Value);
    Serial.println("  ug/m3");
  }
  Serial.print("Humidity ");
  Serial.print(aq_data.hum);
  Serial.println(" %");

  Serial.print("Temperature ");
  Serial.print(aq_data.temp);
  Serial.println(" Deg.");

  Serial.println();
}
#endif

void loop() {
  // Temperature/Humidity readings
  aq_data.hum = dht.readHumidity();
  aq_data.temp = dht.readTemperature();
  publishTempHum(aq_data.temp, aq_data.hum);

  // PM readings
  readPMValues();

  if ((millis() > state.last_visualization + 500 )) {
    #ifdef SERIAL_DEBUG
      printToSerial();
    #endif
    state.last_visualization = millis();
    refreshDisplay();
    lcd.setCursor(0, 0);
  }
}
