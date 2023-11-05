part of splash_lib;

class SplashValidationController extends GetxController
    with StateMixin, WidgetsBindingObserver {
  final SplashNavigationController controllerNavigation =
      Get.find<SplashNavigationController>();

  Future<bool> requestLocationAccess() async {
    bool result = false;
    if (await functionSharing.isLocationPermanentlyDenied()) {
      logger.d('denied permanen');
      // openAppSettings();
    } else {
      Future.delayed(const Duration(milliseconds: 200), () async {
        await functionSharing.location.then((_) async {
          if (await functionSharing.isLocationGranted()) {
            logger.d('diijinkan');
            result = true;
          } else {
            logger.d('tidak diijinkan');
            result = false;
          }
        });
      });
    }
    return result;
  }

  Future<void> setGeoLocation() async {
    var locationData = await functionSharing.location;
    Future.delayed(const Duration(seconds: 3), () {
      controllerNavigation.gotoHomeFromSplash(currentLocation: {
        argument.latitudeData: locationData.latitude,
        argument.longitudeData: locationData.longitude,
      });
    });
  }

  Future<void> initSplashScreen() async {
    change(RxStatus.loading());
      functionSharing.isLocationGranted().then((value) async {
        if (value == true) {
          logger.d('location status : true');
          setGeoLocation();
        } else {
          logger.d('location status : false');
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
      if (await functionSharing.isLocationGranted()) {
        setGeoLocation();
      } else if (await functionSharing.isLocationPermanentlyDenied()) {
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
