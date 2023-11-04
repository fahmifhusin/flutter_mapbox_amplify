part of splash_lib;

class SplashController extends GetxController{
  DeviceSetup setup = DeviceSetup();
  @override
  void onInit(){
    setup.setDeviceSetup();
    super.onInit();
  }
}
