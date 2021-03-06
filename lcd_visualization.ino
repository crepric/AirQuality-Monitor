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
// Remember Changes in the various visualization must also update the line count
// in the vector visualization_line_counts_ (defined in common_defines.h).

// Character bitmap for the simbol of cube (exp 3), with a dot in the bottom to mark
// that the PM sensor is active.
byte cube_display_on[8] = {
  B11100,
  B00100,
  B01100,
  B00100,
  B11100,
  B00000,
  B00011,
  B00011,
};

void setupLCD() {
  // Setup LCD
  lcd.begin(16, 2);
  lcd.setCursor(0, 0);
  lcd.createChar(0, cube_display_on);
}

// Print a histogram bar based.
void printbar(int value, int max_value, int num_segments) {
  int quantum = max_value / num_segments;
  int hist_size = value / quantum;
  if (value > max_value) {
    hist_size = num_segments;
  }
  for (int i = 0; i < hist_size; i++) {
    lcd.write(0x11);
  }
}

// Visualize PM Histogram on Display
void visualizePmHistogram() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM1.0: ");
    printbar(aq_data_.PM1Value, 500, 10);
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM2.5: ");
    printbar(aq_data_.PM2_5Value, 500, 10);
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM10 : ");
    printbar(aq_data_.PM10Value, 500, 10);
  }
}

// Visualize PM Data on Display
void visualizePmData() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM1.0: ");
    lcd.print(aq_data_.PM1Value);
    lcd.setCursor(11, current_line - first_line_offset_);
    lcd.write(0xea);  // mu
    lcd.print("g/m");
    if (state_.pm_active) {
      lcd.write(byte(0)); 
    } else {
      lcd.write(0x1f);
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM2.5: ");
    lcd.print(aq_data_.PM2_5Value);
    lcd.setCursor(11, current_line - first_line_offset_);
    lcd.write(0xea);  // mu
    lcd.print("g/m");
    if (state_.pm_active) {
      lcd.write(byte(0)); 
    } else {
      lcd.write(0x1f);
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM10 : ");
    lcd.print(aq_data_.PM10Value);
    lcd.setCursor(11, current_line - first_line_offset_);
    lcd.write(0xea);
    lcd.print("g/m");  //mu
    if (state_.pm_active) {
      lcd.write(byte(0)); 
    } else {
      lcd.write(0x1f);
    }
  }
}

// Visualize Temp/Hum Data on Display
void visualizeTempHumData() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("Temp: ");
    lcd.print(aq_data_.temp);
    lcd.write(0xb2);
    lcd.print("C");
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("Hum:  ");
    lcd.print(aq_data_.hum);
    lcd.print(" %");
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("BP: ");
    lcd.print((int) aq_data_.press);
    lcd.print(" Pa");
  }
}

// Visualize device state information
void visualizeState() {
  lcd.clear();
  int current_line = 0;
  // PM sensor
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM State: ");
    if (state_.pm_active) {
      lcd.print("ON");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("PM Timer: ");
    if (config_data_.pm_dc_mode == PM_SENSOR_15M) {
      if (state_.pm_active) {
        lcd.print((state_.pm_off_time - millis())/1000);
      } else {
        lcd.print((state_.pm_on_time - millis())/1000);
      }
    } else {
      lcd.print("N/A");
    }
  }
  current_line ++;
  // FAN
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("FAN State: ");
    if (state_.fan_active) {
      lcd.print("ON");
    } else {
      lcd.print("OFF");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("FAN Timer: ");
    if (config_data_.fan_mode == FAN_MODE_10_MINS) {
      if (state_.fan_active) {
        lcd.print((state_.fan_off_time - millis())/1000);
      } else {
        lcd.print((state_.fan_on_time - millis())/1000);
      }
    } else if (config_data_.fan_mode == FAN_MODE_PM_SYNC &&
               config_data_.pm_dc_mode == PM_SENSOR_15M) {
      if (state_.fan_active) {
        lcd.print((state_.pm_off_time - millis())/1000);
      } else {
        lcd.print((state_.pm_on_time - millis())/1000);
      }
    } else {
      lcd.print("N/A");
    }
  }
  current_line ++;
  // LCD
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("LCD Timer: ");
    if (config_data_.lcd_bl_mode == LCD_BL_5S ||
        config_data_.lcd_bl_mode == LCD_BL_10S) {
      if (state_.lcd_off_time == 0) {
        lcd.print("Off");
      } else {
        lcd.print((state_.lcd_off_time - millis()) / 1000);
      }
    } else {
      lcd.print("N/A");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("BT Status: ");
    BLECentral central = blePeripheral.central();
    if (central) {
      // while the central is still connected to peripheral:
      if (central.connected()) {
        lcd.print("Conn");
      } else {
        lcd.print("Disc");
      }
    } else {
      lcd.print("Disc");
    }
  }
  current_line ++;
  if (current_line == first_line_offset_ ||
      current_line == first_line_offset_ + 1) {
    lcd.setCursor(0, current_line - first_line_offset_);
    lcd.print("Config: ");
    lcd.print(encodeConfigData(config_data_), HEX);
  }
}

void refreshDisplay(bool config_changed) {
  if ((config_data_.lcd_bl_mode == LCD_BL_5S || 
       config_data_.lcd_bl_mode == LCD_BL_10S) && 
      state_.lcd_off_time > 0 && 
      state_.lcd_off_time < millis()) {
    digitalWrite(LCD_BACKLIGHT_PIN, LOW);
    state_.lcd_off_time = 0;
  }
  if (config_changed) {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("New Config:");
    lcd.setCursor(0,1);
    lcd.print(encodeConfigData(config_data_), HEX);
    return;
  }
  switch (config_data_.visualization) {
    case VISUALIZATION_PM_DATA:
      visualizePmData();
      break;
    case VISUALIZATION_PM_HIST:
      visualizePmHistogram();
      break;
    case VISUALIZATION_TEMP_HUM:
      visualizeTempHumData();
      break;
    case VISUALIZATION_CONFIGS:
      visualizeConfigMenu();
      if (state_.select_pressed) {
        toggleConfigOption();
        state_.select_pressed = false;
      }
      break;
    case VISUALIZATION_STATE:
      visualizeState();
      break;
    default:
      break;
  }
  if (config_data_.auto_scroll && 
      visualization_line_counts_[config_data_.visualization] > 2 &&
      config_data_.visualization != VISUALIZATION_CONFIGS) {
        first_line_offset_ = mod(first_line_offset_ + 1,
                              visualization_line_counts_[config_data_.visualization]);
  }
}
