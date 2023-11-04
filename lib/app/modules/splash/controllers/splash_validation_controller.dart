part of splash_lib;

class SplashValidationController extends GetxController with StateMixin {
  final SplashNavigationController controllerNavigation =
      Get.find<SplashNavigationController>();

  Future<bool> requestLocationAccess() async {
    bool result = false;
    // if (await Permission.location.isPermanentlyDenied) {
    //   logger.d('denied permanen');
    //   AppSettings.openAppSettings(type: AppSettingsType.location);
    //   await Permission.location.request().whenComplete(() async {
    //     if (await Permission.location.isGranted) {
    //       result = true;
    //     } else {
    //       result = false;
    //     }
    //   });
    // }else{
    await Permission.location.request().whenComplete(() async {
      if (await Permission.location.isGranted) {
        result = true;
      } else {
        result = false;
      }
    });
    // }
    return result;
  }

  Future<void> initSplashScreen() async {
    String currentLocation = 'location is deny';
    change(RxStatus.loading());
    requestLocationAccess().then((value) async {
      if (value == true) {
        functionSharing.getCurrentCoordinate().then((value) {
          currentLocation = value;
          Future.delayed(const Duration(seconds: 3), () {
            controllerNavigation.gotoHomeFromSplash(
                currentLocation: currentLocation);
          });
        });
      } else {
        requestLocationAccess();
      }
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
