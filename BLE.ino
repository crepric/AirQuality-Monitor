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

// BLE service definitions.
BLEPeripheral blePeripheral; // create peripheral instance
BLEService AQService("1e55000-e229-4d47-ac2d-59871700c944"); // create service
BLEUnsignedIntCharacteristic PM1_Characteristic("1e55001-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLEUnsignedIntCharacteristic PM2_5_Characteristic("1e55002-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLEUnsignedIntCharacteristic PM10_Characteristic("1e55003-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLEFloatCharacteristic Temp_Characteristic("1e55004-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLEFloatCharacteristic Hum_Characteristic("1e55005-e229-4d47-ac2d-59871700c944", BLERead | BLENotify);
BLEUnsignedLongCharacteristic Config_Characteristic("1e55006-e229-4d47-ac2d-59871700c944", BLERead | BLEWrite | BLENotify);

void setupBLE() {
  // BLE setup
  blePeripheral.setLocalName("AQ_BLE");
  blePeripheral.setAdvertisedServiceUuid(AQService.uuid());
  blePeripheral.addAttribute(AQService);
  blePeripheral.addAttribute(PM1_Characteristic);
  blePeripheral.addAttribute(PM2_5_Characteristic);
  blePeripheral.addAttribute(PM10_Characteristic);
  blePeripheral.addAttribute(Temp_Characteristic);
  blePeripheral.addAttribute(Hum_Characteristic);
  blePeripheral.addAttribute(Config_Characteristic);
  PM1_Characteristic.setValue(0);
  PM2_5_Characteristic.setValue(0);
  PM10_Characteristic.setValue(0);
  Temp_Characteristic.setValue(0);
  Hum_Characteristic.setValue(0);
  unsigned long config_encoded = encodeConfigData(config_data_);
  Config_Characteristic.setValue(config_encoded);
  blePeripheral.begin();
}

void verifyConfigUpdates() {
//  BLECentral central = blePeripheral.central();
//  if (central) {
//    // while the central is still connected to peripheral:
//    if (central.connected()) {
      if (Config_Characteristic.written()) {
        unsigned long config_encoded;
        config_encoded = Config_Characteristic.value();
        setConfigsFromEncodedData(config_encoded);
        saveConfigToEprom();
      }
//    }
//  }
}

void maybePublishTempHum(float temp, float hum) {
  if (config_data_.ble_data_mode == BLE_SEND_NEVER) return;

  if (config_data_.ble_data_mode == BLE_SEND_ALWAYS ||
      abs(temp - last_sent_aq_data_.temp) > 0.5) {
    Temp_Characteristic.setValue(temp);
    last_sent_aq_data_.temp = temp;
  }
  if (config_data_.ble_data_mode == BLE_SEND_ALWAYS ||
      abs(hum - last_sent_aq_data_.hum) > 0.5) {
    Hum_Characteristic.setValue(hum );
    last_sent_aq_data_.hum = hum;
  }
}

void maybePublishPMValues(int PM1Value, int PM2_5Value, int PM10Value) {
  if (config_data_.ble_data_mode == BLE_SEND_NEVER) return;
  if (config_data_.ble_data_mode == BLE_SEND_ALWAYS ||
      (PM1Value != last_sent_aq_data_.PM1Value)) {
    PM1_Characteristic.setValue(PM1Value);
    last_sent_aq_data_.PM1Value = PM1Value;

  }
  if (config_data_.ble_data_mode == BLE_SEND_ALWAYS ||
      (PM2_5Value != last_sent_aq_data_.PM2_5Value)) {
    PM2_5_Characteristic.setValue(PM2_5Value);
    last_sent_aq_data_.PM2_5Value = PM2_5Value;

  }
  if (config_data_.ble_data_mode == BLE_SEND_ALWAYS ||
      (PM10Value != last_sent_aq_data_.PM10Value)) {
    PM10_Characteristic.setValue(PM10Value);
    last_sent_aq_data_.PM10Value = PM10Value;

  }
}

void publishNewConfigOnBLE() {
  unsigned long config_encoded = encodeConfigData(config_data_);
  Config_Characteristic.setValue(config_encoded);
}
