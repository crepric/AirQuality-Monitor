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

// Encodes the current config in a 4-byte bitset to be sent over BLE or stored in EEPROM
//  -----------------------------------------------------------------------------------------------------
// | Byte 4  | Byte 3  |                    byte  2               |               byte 1                 |
//  -----------------------------------------------------------------------------------------------------
// |  8 - 0  | 8 - 0   |   7 - 6 |   5   | 4 - 3    |     2 - 0   |    7 - 5    |     4  |    3 - 0      |
//  -----------------------------------------------------------------------------------------------------
// | UNUSED  | UNUSED  | UNUSED  | AU_SC | BLE_MODE | PM_DC_MODE  | LCD_BL_MODE | FAN_ON | VISUALIZATION |
//  -----------------------------------------------------------------------------------------------------
unsigned long encodeConfigData(struct ConfigData config_data) {
  char byte_1 = (config_data.visualization & 0xF) |
                (config_data.fan_on << 4) |
                ((config_data.lcd_bl_mode & 0x7) << 5);
  char byte_2 = (config_data.pm_dc_mode & 0x7) |
                (config_data.ble_data_mode & 0x3) << 3 |
                (config_data.auto_scroll << 5);
                
  char byte_3 = 0;
  char byte_4 = 0;
  return byte_1 | byte_2 << 8 | byte_3 << 16 | byte_4 << 24;
}

struct ConfigData decodeConfigData(unsigned long encoded_config_data) {
  char byte_1 = encoded_config_data & 0xFF;
  char byte_2 = (encoded_config_data >> 8) & 0xFF;
  struct ConfigData res;
  // Byte 1.
  res.visualization = (Views) (byte_1 & 0xF);
  res.fan_on = (byte_1 >> 4) & 0x1;
  res.lcd_bl_mode = (LcdBlModes) ((byte_1 >> 5) & 0x7);
  // Byte 2.
  res.pm_dc_mode = (PmSensorModes) (byte_2 & 0x7);
  res.ble_data_mode = (BLEDataModes) ((byte_2 >> 3) & 0x3);
  res.auto_scroll = (byte_2 >> 5) & 0x1;
  return res;
}

// Visualize Config Menu on Display
void visualizeConfigMenu() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("LCD BL: ");
    lcd.setCursor(12, current_line - first_line_offset_);
    if (config_data_.lcd_bl_mode == LCD_BL_ON) {
      lcd.print(" ON");
    } else if (config_data_.lcd_bl_mode == LCD_BL_5S) {
      lcd.print(" 5s");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("Fan: ");
    lcd.setCursor(12, current_line - first_line_offset_);
    lcd.print(config_data_.fan_on ? "ON" : "OFF");
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM d.c.: ");
    lcd.setCursor(12, current_line - first_line_offset_);
    if (config_data_.pm_dc_mode == PM_SENSOR_ALWAYS_ON) {
      lcd.print(" ON");
    } else if (config_data_.pm_dc_mode == PM_SENSOR_15M) {
      lcd.print("15m");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("BLE Mode: ");
    lcd.setCursor(12, current_line - first_line_offset_);
    if (config_data_.ble_data_mode == BLE_SEND_NEVER) {
      lcd.print("OFF");
    } else if (config_data_.ble_data_mode == BLE_SEND_ALWAYS) {
      lcd.print(" ON");
    } else if (config_data_.ble_data_mode == BLE_SEND_ON_CHANGE) {
      lcd.print("CHG");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("Auto Scr.: ");
    lcd.setCursor(12, current_line - first_line_offset_);
    if (config_data_.auto_scroll) {
      lcd.print(" ON");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  lcd.setCursor(15, 0);
  lcd.write(0xf7);
}

void setConfigsFromEprom() {
  // Backlight and Fan
  pinMode(LCD_BACKLIGHT_PIN, OUTPUT);
  pinMode(FAN_CONTROL_PIN, OUTPUT);
  unsigned long encoded_config_data = 0x00000000;
  for (size_t i = 0; i < sizeof(encoded_config_data); ++i) {
    char byte_value = EEPROM.read(CONFIG_ADDRESS + i);
    encoded_config_data |= (byte_value & 0xFF) << (i * 8);
  }
  setConfigsFromEncodedData(encoded_config_data);
}

void setConfigsFromEncodedData(unsigned long encoded_config_data) {
  config_data_ = decodeConfigData(encoded_config_data);
  if (config_data_.lcd_bl_mode == LCD_BL_ON || config_data_.lcd_bl_mode == LCD_BL_5S) {
    digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
    // This will only matter if mode is 5s;
    state_.lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
  } else {
    digitalWrite(LCD_BACKLIGHT_PIN, LOW);
  }


  digitalWrite(FAN_CONTROL_PIN, config_data_.fan_on ? LOW : HIGH);


  if (config_data_.pm_dc_mode == PM_SENSOR_ALWAYS_ON || config_data_.pm_dc_mode == PM_SENSOR_15M) {
    digitalWrite(PM_SENSOR_SLEEP, HIGH);
    // This will only matter if mode is 15m;
    state_.pm_off_time = millis() + PM_ACTIVE_TIMEOUT_MS;
    state_.pm_active = true;
  } else {
    digitalWrite(PM_SENSOR_SLEEP, LOW);
    state_.pm_active = false;
  }

}

// Circles among the possible values for the option displayed
// on the first line of the screen. Order of the checks here must
// match the order of the visualization in the previous function.
void toggleConfigOption() {
  noInterrupts();
  int current_line = 0;
  // LCD
  if (current_line == first_line_offset_) {
    config_data_.lcd_bl_mode = (LcdBlModes) mod((config_data_.lcd_bl_mode + 1), LCD_BL_MODES_COUNT);
    if (config_data_.lcd_bl_mode == LCD_BL_ON || config_data_.lcd_bl_mode == LCD_BL_5S) {
      digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
      // This will only matter if mode is 5s;
      state_.lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
    } else {
      digitalWrite(LCD_BACKLIGHT_PIN, LOW);
    }
  }
  current_line ++;
  // FAN
  if (current_line == first_line_offset_) {
    config_data_.fan_on = !config_data_.fan_on;
    digitalWrite(FAN_CONTROL_PIN, config_data_.fan_on ? LOW : HIGH);
  }
  current_line ++;
  // PM Sensor Duty Cicle
  if (current_line == first_line_offset_) {
    config_data_.pm_dc_mode = (PmSensorModes) mod((config_data_.pm_dc_mode + 1), PM_DC_MODES_COUNT);
    if (config_data_.pm_dc_mode == PM_SENSOR_ALWAYS_ON || config_data_.pm_dc_mode == PM_SENSOR_15M) {
      digitalWrite(PM_SENSOR_SLEEP, HIGH);
      // This will only matter if mode is 5s;
      state_.pm_off_time = millis() + PM_ACTIVE_TIMEOUT_MS;
      state_.pm_active = true;
    } else {
      digitalWrite(PM_SENSOR_SLEEP, LOW);
      state_.pm_active = false;
    }
    //EEPROM.write(PM_SENSOR_DUTYCICLE_ADDRESS, config_data_.pm_dc_mode);
  }
  current_line ++;
  // BLE Mopde
  if (current_line == first_line_offset_) {
    config_data_.ble_data_mode = (BLEDataModes) mod((config_data_.ble_data_mode + 1), BLE_DATA_MODES_COUNT);
  }
  current_line ++;
  // Auto scroll;
  if (current_line == first_line_offset_) {
    config_data_.auto_scroll = !config_data_.auto_scroll;
  }  
  saveConfigToEprom();
  interrupts();
  publishNewConfigOnBLE();
}

void saveConfigToEprom() {
  unsigned long encoded_config_data = encodeConfigData(config_data_);
  for (size_t i = 0; i < sizeof(encoded_config_data); ++i) {
    EEPROM.write(CONFIG_ADDRESS + i, (char)((encoded_config_data >> (i * 8)) & 0xFF));
  }
}
