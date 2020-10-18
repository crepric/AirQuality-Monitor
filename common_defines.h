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
#define SERIAL_DEBUG

// FAN control pin
#define FAN_CONTROL_PIN 0

// Use of defines rather than enums mostly as a philosophy to save memory.
// Symbol Definitions
#define PM_PACKET_LEN 31  // Data packet Length for PM sensor (minus the first fixed byte) 0x42 + 31 bytes equal to 32 bytes

// ==========================
// LCD definitions
// ==========================
#define LCD_BL_TIMEOUT_MS 5000
#define BTN_CHECK_INTERVAL_MS 200000
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
  VISUALIZATION_COUNT,
};

// Global state variables for visualization
// Defines the offset for a multi-line visualization in the current window.
int first_line_offset = 0;
// Visualization lines for each mode (index matches the constant
// definition for a specific mode. Number of lines is number of
// data entries for that mode.
int visualization_line_counts[] = {
  /* VISUALIZATION_PM_DATA */3,
  /* VISUALIZATION_PM_HIST */3,
  /* VISUALIZATION_TEMP_HUM */ 2,
  /* VISUALIZATION_CONFIGS */ 3,
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

unsigned char pm_serial_buf[PM_PACKET_LEN];

// EEPROM locations for config values
#define LCD_BL_MODE_ADDRESS 0
#define FAN_ON_ADDRESS 1
#define PM_SENSOR_DUTYCICLE_ADDRESS 2

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
} aq_data;

// Configuration bits
struct ConfigData {
  // Defines the current visualization mode
  Views visualization = VISUALIZATION_PM_DATA;
  // Device config
  bool fan_on = false;
  LcdBlModes lcd_bl_mode = LCD_BL_5S;
  PmSensorModes pm_dc_mode = PM_SENSOR_ALWAYS_ON;
} config_data;

struct State {
  // Tracks last refresh of the display.
  unsigned long last_visualization = millis();
  // If lcd is in 5s mode, this variable records when we want to turn it off.
  unsigned long lcd_off_time = 0;
  // PM sensor duty cycle.
  unsigned long pm_off_time = 0;
  unsigned long pm_on_time = 0;
  boolean pm_active = true;  // Start with measurements.
  // If we are in config mode, and the select button is pressed,
  // the event is recorded and processed in the next loop.
  bool select_pressed = false;
} state;

#endif