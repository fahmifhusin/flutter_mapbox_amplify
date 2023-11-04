part of splash_lib;

class SplashNavigationController extends GetxController {
  void gotoHomeFromSplash(){
    Get.offAllNamed(Routes.HOME);
  }
}
