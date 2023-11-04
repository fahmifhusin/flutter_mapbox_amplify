part of splash_lib;

class SplashValidationController extends GetxController with StateMixin {
  final SplashNavigationController controllerNavigation =
      Get.find<SplashNavigationController>();

  void initSplashScreen() {
    change(RxStatus.loading());
    Future.delayed(const Duration(seconds: 3), () {
      controllerNavigation.gotoHomeFromSplash();
    });
  }

  void changeSplashSuccess() => change(RxStatus.success());

  @override
  void onInit() {
    initSplashScreen();
    super.onInit();
  }

  @override
  void onClose() {
    changeSplashSuccess();
    super.onClose();
  }
}
