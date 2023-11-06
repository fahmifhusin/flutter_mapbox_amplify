import 'package:flutter/services.dart';

class DeviceSetup{
  Future<void> setDeviceSetup() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}