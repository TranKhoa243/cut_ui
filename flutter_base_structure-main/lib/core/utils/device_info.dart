
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
class DeviceInfo {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // static final storage = FlutterSecureStorage();

  static Future<String?> get deviceId  async {
    if (Platform.isIOS) {
      // var deviceIdServer = await storage.read(key: 'device_id_ios_server');
      var deviceIdServer = await FlutterKeychain.get(key: "device_id_ios_server");
      if(deviceIdServer==null){
        var iosDeviceInfo = await deviceInfo.iosInfo;
        // await storage.write(key: 'device_id_ios_server', value: iosDeviceInfo.identifierForVendor);
        await FlutterKeychain.put(key: "device_id_ios_server", value: iosDeviceInfo.identifierForVendor!);
        deviceIdServer=iosDeviceInfo.identifierForVendor;
      }

      return deviceIdServer;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
  }

  static Future<String?> get deviceName  async {
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.model;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    }
  }
}
