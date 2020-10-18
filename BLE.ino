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
BLEUnsignedIntCharacteristic PM1_Characteristic("A001", BLERead | BLENotify);
BLEUnsignedIntCharacteristic PM2_5_Characteristic("A002", BLERead | BLENotify);
BLEUnsignedIntCharacteristic PM10_Characteristic("A003", BLERead | BLENotify);
BLEFloatCharacteristic Temp_Characteristic("A004", BLERead | BLENotify);
BLEFloatCharacteristic Hum_Characteristic("A005", BLERead | BLENotify);

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
  PM1_Characteristic.setValue(0);
  PM2_5_Characteristic.setValue(0);
  PM10_Characteristic.setValue(0);
  Temp_Characteristic.setValue(0);
  Hum_Characteristic.setValue(0);
  blePeripheral.begin();
}

void publishTempHum(float temp, float hum) {
  Temp_Characteristic.setValue(temp);
  Hum_Characteristic.setValue(hum );
}

void publishPMValues(int PM1Value, int PM2_5Value, int PM10Value) {
  PM1_Characteristic.setValue(PM1Value);
  PM2_5_Characteristic.setValue(PM2_5Value);
  PM10_Characteristic.setValue(PM10Value);
}
