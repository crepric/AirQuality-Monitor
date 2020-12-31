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

#ifndef COMMON_DEFINES
#define COMMON_DEFINES

#include <Arduino.h>
#include <CurieBLE.h>
#include <CurieTimerOne.h>
#include <DHT.h>
#include <EEPROM.h>
#include <LiquidCrystal.h>
#include <SoftwareSerial.h>

// Configs
// #define SERIAL_DEBUG

// ==========================
// FAN definitions
// ==========================
// FAN control pin
#define FAN_CONTROL_PIN 0
#define FAN_DC_ACTIVE_TIMEOUT_MS 60000 // 1 min
#define FAN_DC_INACTIVE_TIMEOUT_MS 540000 // 9 min
enum FanModes {
  FAN_MODE_OFF = 0,
  FAN_MODE_ON,
  FAN_MODE_PM_SYNC,
  FAN_MODE_10_MINS,
  FAN_MODES_COUNT,
};

// Use of defines rather than enums mostly as a philosophy to save memory.
// Symbol Definitions
#define PM_PACKET_LEN 31  // Data packet Length for PM sensor (minus the first fixed byte) 0x42 + 31 bytes equal to 32 bytes

// ==========================
// LCD definitions
// ==========================
#define LCD_BL_TIMEOUT_5000_MS 5000
#define LCD_BL_TIMEOUT_10000_MS 10000
#define BTN_CHECK_INTERVAL_MS 200000
#define LCD_REFRESH_INTERVAL 500
#define LCD_CONFIG_DISPLAY_DURATION 5000
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
// LCD buttons codes.
enum Buttons {
  btnRIGHT = 0,
  btnUP,
  btnDOWN,
  btnLEFT,
  btnSELECT,
  btnNONE,
};

// LCD contol pins
#define LCD_BACKLIGHT_PIN 10
// LCD Backlight modes
enum LcdBlModes {
  LCD_BL_ON = 0,
  LCD_BL_OFF,
  LCD_BL_5S,
  LCD_BL_10S,
  LCD_BL_MODES_COUNT // C defines enum as increments by 1, so this is the number of elements.
};

// Visualization mode codes
// This number must match the number of visualization modes.
// For each visualization mode, a maximum number of
// lines must also be specified.
enum Views {
  VISUALIZATION_PM_DATA = 0,
  VISUALIZATION_PM_HIST,
  VISUALIZATION_TEMP_HUM,
  VISUALIZATION_CONFIGS,
  VISUALIZATION_STATE,
  VISUALIZATION_COUNT,
};

// Global state variables for visualization
// Defines the offset for a multi-line visualization in the current window.
int first_line_offset_ = 0;
// Visualization lines for each mode (index matches the constant
// definition for a specific mode. Number of lines is number of
// data entries for that mode.
int visualization_line_counts_[] = {
  /* VISUALIZATION_PM_DATA */3,
  /* VISUALIZATION_PM_HIST */3,
  /* VISUALIZATION_TEMP_HUM */ 2,
  /* VISUALIZATION_CONFIGS */ 5,
  /* VISUALIZATION_STATE */ 5,
};

// ======================
// Hum / Temp definitions
// ======================
// DHT22 Temp/Hum sensor config
#define DHTPIN 3
#define DHTTYPE DHT22  // DHT 22  (AM2302)

DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino

// =====================
// PM definitions
// =====================

// PM Sensor PINs
#define PM_SENSOR_SLEEP A3  // HIGH means active, LOW puts sensor to sleep
#define PM_ACTIVE_TIMEOUT_MS 60000
#define PM_INACTIVE_TIMEOUT_MS 840000

#define PM_SENSOR_SERIAL_TX 1
#define PM_SENSOR_SERIAL_RX 2
// Component interfaces definitions
SoftwareSerial PMSerial(PM_SENSOR_SERIAL_RX, PM_SENSOR_SERIAL_TX); // RX, TX

// PM Sensor DutyCicle modes
enum PmSensorModes {
  PM_SENSOR_ALWAYS_OFF = 0,
  PM_SENSOR_ALWAYS_ON,
  PM_SENSOR_15M,
  PM_DC_MODES_COUNT
};

// ==================
// Connection modes
// ==================
enum BLEDataModes {
  BLE_SEND_NEVER = 0,
  BLE_SEND_ALWAYS,
  BLE_SEND_ON_CHANGE,
  BLE_DATA_MODES_COUNT
};

unsigned char pm_serial_buf[PM_PACKET_LEN];

// EEPROM locations for config values
#define CONFIG_ADDRESS 0

// Definition of mod that accounts for negative numbers
// e.g.
//   mod(-1, 4) = 3
//   mod(-2, 4) = 2
//   mod(-3, 4) = 1
int mod(int a, int b) {
  int r = a % b;
  return r < 0 ? r + b : r;
}

// All air quality data is stored and updated in the following struct.
struct AqData {
  // Particulate Data
  int PM1Value = -1;
  int PM2_5Value = -1;
  int PM10Value = -1;
  // Variables for Temp/Hum sensor
  float hum = -1.0;  //Stores humidity value
  float temp = -1.0; //Stores temperature value
} aq_data_, last_sent_aq_data_;

// Configuration bits
struct ConfigData {
  // Defines the current visualization mode
  Views visualization = VISUALIZATION_PM_DATA;
  // Device config
  FanModes fan_mode = FAN_MODE_OFF;
  LcdBlModes lcd_bl_mode = LCD_BL_5S;
  PmSensorModes pm_dc_mode = PM_SENSOR_ALWAYS_ON;
  BLEDataModes ble_data_mode = BLE_SEND_ALWAYS;
  // Visualization auto-scroll
  bool auto_scroll = false;
} config_data_;

struct State {
  // Tracks last refresh of the display.
  unsigned long next_visualization = millis();
  // If lcd is in 5s mode, this variable records when we want to turn it off.
  unsigned long lcd_off_time = 0;
  // PM sensor duty cycle.
  unsigned long pm_off_time = 0;
  unsigned long pm_on_time = 0;
  boolean pm_active = true;  // Start with measurements.
  // If we are in config mode, and the select button is pressed,
  // the event is recorded and processed in the next loop.
  bool select_pressed = false;
  // Fan duty cycle.
  unsigned long fan_off_time = 0;
  unsigned long fan_on_time = 0;
  boolean fan_active = false;  // Start with fan off and let the saved config decide.
} state_;

#endif
