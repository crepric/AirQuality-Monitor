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

// Visualize Config Menu on Display
void visualizeConfigMenu() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("LCD BL: ");
    lcd.setCursor(12, current_line - first_line_offset);
    if (config_data.lcd_bl_mode == LCD_BL_ON) {
      lcd.print("ON");
    } else if (config_data.lcd_bl_mode == LCD_BL_5S) {
      lcd.print("5s");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("Fan: ");
    lcd.setCursor(12, current_line - first_line_offset);
    lcd.print(config_data.fan_on ? "ON" : "OFF");
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM d.c.: ");
    lcd.setCursor(12, current_line - first_line_offset);
    if (config_data.pm_dc_mode == PM_SENSOR_ALWAYS_ON) {
      lcd.print("ON");
    } else if (config_data.pm_dc_mode == PM_SENSOR_15M) {
      lcd.print("15m");
    } else {
      lcd.print("OFF");
    }
  }
  lcd.setCursor(15, 0);
  lcd.write(0xf7);
}

void setConfigsFromEprom() {
    // Backlight and Fan
  pinMode(LCD_BACKLIGHT_PIN, OUTPUT);
  pinMode(FAN_CONTROL_PIN, OUTPUT);
  config_data.lcd_bl_mode = (LcdBlModes) EEPROM.read(LCD_BL_MODE_ADDRESS);
  if (config_data.lcd_bl_mode == LCD_BL_ON || config_data.lcd_bl_mode == LCD_BL_5S) {
    digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
    // This will only matter if mode is 5s;
    state.lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
  } else {
    digitalWrite(LCD_BACKLIGHT_PIN, LOW);
  }
  
  config_data.fan_on = EEPROM.read(FAN_ON_ADDRESS);
  digitalWrite(FAN_CONTROL_PIN, config_data.fan_on ? LOW : HIGH);

  config_data.pm_dc_mode = (PmSensorModes)EEPROM.read(PM_SENSOR_DUTYCICLE_ADDRESS);
  if (config_data.pm_dc_mode == PM_SENSOR_ALWAYS_ON || config_data.pm_dc_mode == PM_SENSOR_15M) {
    digitalWrite(PM_SENSOR_SLEEP, HIGH);
    // This will only matter if mode is 15m;
    state.pm_off_time = millis() + PM_ACTIVE_TIMEOUT_MS;
    state.pm_active = true;
  } else {
    digitalWrite(PM_SENSOR_SLEEP, LOW);
    state.pm_active = false;
  }
  
}

// Circles among the possible values for the option displayed
// on the first line of the screen.
void toggleConfigOption() {
  int current_line = 0;
  // LCD
  if (current_line == first_line_offset) {
    config_data.lcd_bl_mode = (LcdBlModes) mod((config_data.lcd_bl_mode + 1), LCD_BL_MODES_COUNT);
    if (config_data.lcd_bl_mode == LCD_BL_ON || config_data.lcd_bl_mode == LCD_BL_5S) {
      digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
      // This will only matter if mode is 5s;
      state.lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
    } else {
      digitalWrite(LCD_BACKLIGHT_PIN, LOW);
    }
    EEPROM.write(LCD_BL_MODE_ADDRESS, config_data.lcd_bl_mode);
  }
  current_line ++;
  // FAN
  if (current_line == first_line_offset) {
    config_data.fan_on = !config_data.fan_on;
    digitalWrite(FAN_CONTROL_PIN, config_data.fan_on ? LOW : HIGH);
    EEPROM.write(FAN_ON_ADDRESS, config_data.fan_on);
  }
  current_line ++;
  // PM Sensor Duty Cicle
  if (current_line == first_line_offset) {
    config_data.pm_dc_mode = (PmSensorModes) mod((config_data.pm_dc_mode + 1), PM_DC_MODES_COUNT);
    if (config_data.pm_dc_mode == PM_SENSOR_ALWAYS_ON || config_data.pm_dc_mode == PM_SENSOR_15M) {
      digitalWrite(PM_SENSOR_SLEEP, HIGH);
      // This will only matter if mode is 5s;
      state.pm_off_time = millis() + PM_ACTIVE_TIMEOUT_MS;
      state.pm_active = true;
    } else {
      digitalWrite(PM_SENSOR_SLEEP, LOW);
      state.pm_active = false;
    }
    EEPROM.write(PM_SENSOR_DUTYCICLE_ADDRESS, config_data.pm_dc_mode);
  }
  current_line ++;
}
