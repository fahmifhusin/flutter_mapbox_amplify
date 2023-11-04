import 'package:flutter/services.dart';

class DeviceSetup{
  void setDeviceSetup(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}