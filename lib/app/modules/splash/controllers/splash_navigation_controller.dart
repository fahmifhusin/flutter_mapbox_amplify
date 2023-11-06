part of splash_lib;

class SplashNavigationController extends GetxController {
  void gotoHomeFromSplash({currentLocation}){
    Get.offAllNamed(Routes.HOME,arguments: currentLocation);
  }
}
