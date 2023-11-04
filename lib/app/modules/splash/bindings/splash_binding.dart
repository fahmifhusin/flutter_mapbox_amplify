import 'package:get/get.dart';

import '../splash_lib.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashNavigationController>(
      () => SplashNavigationController(),
    );
    Get.lazyPut<SplashValidationController>(
      () => SplashValidationController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
