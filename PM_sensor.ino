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

#include <Arduino.h>
#include <SoftwareSerial.h>
#include <LiquidCrystal.h>
#include <CurieTimerOne.h>
#include <CurieBLE.h>
#include <EEPROM.h>
#include <DHT.h>

// BLE service definitions.
BLEPeripheral blePeripheral; // create peripheral instance
BLEService AQService("1e553f5d-e229-4d47-ac2d-59871700c944"); // create service
BLECharCharacteristic PM1_Characteristic("1e553f5d-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLECharCharacteristic PM2_5_Characteristic("1e553f5d-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLECharCharacteristic PM10_Characteristic("1e553f5d-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLECharCharacteristic Temp_Characteristic("1e553f5d-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLECharCharacteristic Hum_Characteristic("1e553f5d-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);

// Symbol Definitions
#define PM_PACKET_LEN 31  // Data packet Length for PM sensor (minus the first fixed byte) 0x42 + 31 bytes equal to 32 bytes
// LCD buttons codes.
#define btnRIGHT  0
#define btnUP     1
#define btnDOWN   2
#define btnLEFT   3
#define btnSELECT 4
#define btnNONE   5
// LCD contol pins
#define LCD_BACKLIGHT_PIN 10
// LCD Backlight modes
#define LCD_BL_ON 0
#define LCD_BL_OFF 1
#define LCD_BL_5S 2
#define LCD_BL_MODES_COUNT 3
#define LCD_BL_TIMEOUT_MS 5000

// Visualization mode codes
// This number must match the number of visualization modes.
// For each visualization mode, a maximum number of
// lines must also be specified.
#define VISUALIZATION_COUNT 4
#define VISUALIZATION_PM_DATA 0
#define VISUALIZATION_PM_HIST 1
#define VISUALIZATION_TEMP_HUM 2
#define VISUALIZATION_CONFIGS 3

// Configs
#define SERIAL_DEBUG

// DHT22 Temp/Hum sensor config
#define DHTPIN 3
#define DHTTYPE DHT22  // DHT 22  (AM2302)

// FAN control pin
#define FAN_CONTROL_PIN A4

// EEPROM locations for config values
#define LCD_BL_MODE_ADDRESS 0
#define FAN_ON_ADDRESS 1

// Global Variables for PM sensor
unsigned char pm_serial_buf[PM_PACKET_LEN];
int PM1Value = -1;
int PM2_5Value = -1;
int PM10Value = -1;

// Global Variables for Temp/Hum sensor
float hum;  //Stores humidity value
float temp; //Stores temperature value

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
  /* VISUALIZATION_CONFIGS */ 2,
};
long lcdRefreshTimer = millis();

// Defines the current visualization mode
int visualization = VISUALIZATION_PM_DATA;
const int buttonCheckInUsec = 200000;

// Device config
bool fan_on = false;
int lcd_bl_mode = LCD_BL_5S;
// If we are in config mode, and the select button is pressed,
// the event is recorded and processed in the next loop.
bool select_pressed = false;
// If lcd is in 5s mode, this variable records when we want to turn it off
unsigned long lcd_off_time = 0;

// Component interfaces definitions
SoftwareSerial PMSerial(2, 1); // RX, TX
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino

void setup() {
#ifdef SERIAL_DEBUG
  Serial.begin(9600);
#endif
  // Backlight and Fan
  pinMode(LCD_BACKLIGHT_PIN, OUTPUT);
  pinMode(FAN_CONTROL_PIN, OUTPUT);
  lcd_bl_mode = EEPROM.read(LCD_BL_MODE_ADDRESS);
  if (lcd_bl_mode == LCD_BL_ON || lcd_bl_mode == LCD_BL_5S) {
    digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
    // This will only matter if mode is 5s;
    lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
  } else {
    digitalWrite(LCD_BACKLIGHT_PIN, LOW);
  }

  fan_on = EEPROM.read(FAN_ON_ADDRESS);
  digitalWrite(FAN_CONTROL_PIN, fan_on ? LOW : HIGH);

  // Setup Temp/Humidity sensor
  dht.begin();

  // Setup PM sensor
  PMSerial.begin(9600);
  PMSerial.setTimeout(1500);

  // Setup LCD
  lcd.begin(16, 2);
  lcd.setCursor(0, 0);

  // Start timer reading button presses
  CurieTimerOne.start(buttonCheckInUsec, &timerIsr);

  // BLE setup
  blePeripheral.setLocalName("AQ_BLE");
  blePeripheral.setAdvertisedServiceUuid(AQService.uuid());
  blePeripheral.addAttribute(AQService);
  blePeripheral.addAttribute(PM1_Characteristic);
  blePeripheral.addAttribute(PM2_5_Characteristic);
  blePeripheral.addAttribute(PM10_Characteristic);
  blePeripheral.addAttribute(Temp_Characteristic);
  blePeripheral.addAttribute(Hum_Characteristic);
  PM1_Characteristic.setValue(0);
  PM2_5_Characteristic.setValue(0);
  PM10_Characteristic.setValue(0);
  Temp_Characteristic.setValue(0);
  Hum_Characteristic.setValue(0);
  blePeripheral.begin();
}

// Definition of mod that accounts for negative numbers
// e.g.
//   mod(-1, 4) = 3
//   mod(-2, 4) = 2
//   mod(-3, 4) = 1
int mod(int a, int b) {
  int r = a % b;
  return r < 0 ? r + b : r;
}

// Timer interrupt used to check for button presses.
// Doing so with an interrupt allows for responsiveness even
// when the microcontroller is busy with readings
void timerIsr() {
  int lcd_key = read_LCD_buttons();
  if (lcd_key == btnNONE) {
    return;
  }
  if (lcd_bl_mode == LCD_BL_5S) {
    digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
    // This will only matter if mode is 5s;
    lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
  }
  switch (lcd_key) {
    case btnDOWN:
      first_line_offset = mod(first_line_offset + 1,
                              visualization_line_counts[visualization]);
      break;
    case btnUP:
      first_line_offset = mod( first_line_offset - 1,
                               visualization_line_counts[visualization]);
      break;
    case btnRIGHT:
      visualization = mod(visualization + 1,
                          VISUALIZATION_COUNT);
      first_line_offset = 0;
      break;
    case btnLEFT:
      visualization = mod(visualization - 1,
                          VISUALIZATION_COUNT);
      first_line_offset = 0;
      break;
    case btnSELECT:
      if (visualization == VISUALIZATION_CONFIGS) {
        select_pressed = true;
      }
    case btnNONE:
      break;
  }
}

// Read the buttons.
int read_LCD_buttons() {
  int adc_key_in = analogRead(0);
  if (adc_key_in > 1000) return btnNONE;
  if (adc_key_in < 50)   return btnRIGHT;
  if (adc_key_in < 195)  return btnUP;
  if (adc_key_in < 400)  return btnDOWN;
  if (adc_key_in < 700)  return btnLEFT;
  if (adc_key_in < 990)  return btnSELECT;
  return btnNONE;  // when all others fail, return this...
}

void printToSerial() {
#ifdef SERIAL_DEBUG
  Serial.print("PM1.0: ");
  Serial.print(PM1Value);
  Serial.println(" ug/m3");

  Serial.print("PM2.5: ");
  Serial.print(PM2_5Value);
  Serial.println("  ug/m3");

  Serial.print("PM10 : ");
  Serial.print(PM10Value);
  Serial.println("  ug/m3");

  Serial.print("Humidity ");
  Serial.print(hum);
  Serial.println(" %");

  Serial.print("Temperature ");
  Serial.print(temp);
  Serial.println(" Deg.");

  Serial.println();
#endif
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
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM1.0: ");
    printbar(PM1Value, 500, 10);
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM2.5: ");
    printbar(PM2_5Value, 500, 10);
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM10 : ");
    printbar(PM10Value, 500, 10);
  }
}

// Visualize PM Data on Display
void visualizePmData() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM1.0: ");
    lcd.print(PM1Value);
    lcd.print(" ug/m");
    lcd.write(0x1f);
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM2.5: ");
    lcd.print(PM2_5Value);
    lcd.print(" ug/m");
    lcd.write(0x1f);
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("PM10 : ");
    lcd.print(PM10Value);
    lcd.print(" ug/m");
    lcd.write(0x1f);
  }
}

// Visualize Temp/Hum Data on Display
void visualizeTempHumData() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("Temp: ");
    lcd.print(temp);
    lcd.write(0xb2);
    lcd.print("C");
  }
  current_line ++;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("Hum:  ");
    lcd.print(hum);
    lcd.print(" %");
  }
}

// Visualize Config Menu on Display
void visualizeConfigMenu() {
  lcd.clear();
  int current_line = 0;
  if (current_line == first_line_offset ||
      current_line == first_line_offset + 1) {
    lcd.setCursor(0, current_line - first_line_offset);
    lcd.print("LCD BL: ");
    lcd.setCursor(12, current_line - first_line_offset);
    if (lcd_bl_mode == LCD_BL_ON) {
      lcd.print("ON");
    } else if (lcd_bl_mode == LCD_BL_5S) {
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
    lcd.print(fan_on ? "ON" : "OFF");
  }
  lcd.setCursor(15, 0);
  lcd.write(0xf7);
}

// Circles among the possible values for the option displayed
// on the first line of the screen.
void toggleConfigOption() {
  int current_line = 0;
  if (current_line == first_line_offset) {
    lcd_bl_mode = mod((lcd_bl_mode + 1), LCD_BL_MODES_COUNT);
    if (lcd_bl_mode == LCD_BL_ON || lcd_bl_mode == LCD_BL_5S) {
      digitalWrite(LCD_BACKLIGHT_PIN, HIGH);
      // This will only matter if mode is 5s;
      lcd_off_time = millis() + LCD_BL_TIMEOUT_MS;
    } else {
      digitalWrite(LCD_BACKLIGHT_PIN, LOW);
    }
    EEPROM.write(LCD_BL_MODE_ADDRESS, lcd_bl_mode);
  }
  current_line ++;
  if (current_line == first_line_offset) {
    fan_on = !fan_on;
    digitalWrite(FAN_CONTROL_PIN, fan_on ? LOW : HIGH);
    EEPROM.write(FAN_ON_ADDRESS, fan_on);
  }
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

void loop() {
  // Temperature/Humidity readings
  hum = dht.readHumidity();
  temp = dht.readTemperature();
  Temp_Characteristic.setValue(temp);
  Hum_Characteristic.setValue(hum );
  
  // PM readings
  // First byte of the received sequence is a fixed 0x42 followed by 0x4d
  // see sensor datasheet for reference.
  if (PMSerial.find(0x42)) {
    PMSerial.readBytes(pm_serial_buf, PM_PACKET_LEN);
    if (pm_serial_buf[0] == 0x4d) {
      if (validatePMCheckSum(pm_serial_buf, PM_PACKET_LEN)) {
        PM1Value = extractPM01(pm_serial_buf);
        PM2_5Value = extractPM2_5(pm_serial_buf); //count PM2.5 value of the air detector module
        PM10Value = extractPM10(pm_serial_buf); //count PM10 value of the air detector module
        PM1_Characteristic.setValue(PM1Value);
        PM2_5_Characteristic.setValue(PM2_5Value);
        PM10_Characteristic.setValue(PM10Value);
      }
    }
  }
  if (lcd_bl_mode == LCD_BL_5S && lcd_off_time < millis()) {
    digitalWrite(LCD_BACKLIGHT_PIN, LOW);
  }

  // Refresh data at 1s intervals.
  if (millis() - lcdRefreshTimer >= 500)
  {
    lcdRefreshTimer = millis();
#ifdef SERIAL_DEBUG
    printToSerial();
#endif
    switch (visualization) {
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
        if (select_pressed) {
          toggleConfigOption();
          select_pressed = false;
        }
        break;
      default:
        break;
    }
  }

}
