part of splash_lib;

class SplashNavigationController extends GetxController {
  void gotoHomeFromSplash({String? currentLocation}){
    Get.offAllNamed(Routes.HOME,arguments: currentLocation);
  }
}
