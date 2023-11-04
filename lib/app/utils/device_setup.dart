import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceSetup{
  Future<void> setDeviceSetup() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    await Permission.location.request();
  }
}