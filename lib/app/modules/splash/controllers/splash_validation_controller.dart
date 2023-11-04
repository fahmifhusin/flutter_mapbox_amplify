part of splash_lib;

class SplashValidationController extends GetxController
    with StateMixin, WidgetsBindingObserver {
  final SplashNavigationController controllerNavigation =
      Get.find<SplashNavigationController>();

  Future<bool> requestLocationAccess() async {
    bool result = false;
    if (await Permission.location.isPermanentlyDenied) {
      logger.d('denied permanen');
      openAppSettings();
    } else {
      Future.delayed(const Duration(milliseconds: 200), () async {
        await Permission.location.request().whenComplete(() async {
          if (await Permission.location.isGranted) {
            result = true;
          } else {
            result = false;
          }
        });
      });
    }
    return result;
  }

  void setGeoLocation() {
    functionSharing.getCurrentCoordinate().then((value) {
      Future.delayed(const Duration(seconds: 3), () {
        controllerNavigation.gotoHomeFromSplash(currentLocation: value);
      });
    });
  }

  Future<void> initSplashScreen() async {
    change(RxStatus.loading());
    requestLocationAccess().then((value) async {
      if (value == true) {
        setGeoLocation();
      } else {
        requestLocationAccess();
      }
    });
  }

  void changeSplashSuccess() => change(RxStatus.success());

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    initSplashScreen();
    super.onInit();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Permission.location.isGranted) {
        setGeoLocation();
      }else if(await Permission.location.isPermanentlyDenied) {
        generalDialog.showGeneralSnackbar(
          title: stringConstant.msgTitleErrorLocationDeny,
            msg: stringConstant.msgErrorLocationDeny,
            customColor: Colors.redAccent);
        Future.delayed(const Duration(seconds: 2), () {
          Get.closeCurrentSnackbar();
          requestLocationAccess();
        });
      } else {
        requestLocationAccess();
      }
    }
    logger.d('current lifecycle = $state');
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    changeSplashSuccess();
    super.onClose();
  }
}
