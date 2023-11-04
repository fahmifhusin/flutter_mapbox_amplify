import 'package:get/get.dart';

import '../home_lib.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNavigationController>(
      () => HomeNavigationController(),
    );
    Get.lazyPut<HomeValidationController>(
      () => HomeValidationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
