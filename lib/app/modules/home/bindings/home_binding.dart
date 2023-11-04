import 'package:get/get.dart';

import 'package:flutter_mapbox_amplify/app/modules/home/controllers/home_navigation_controller.dart';
import 'package:flutter_mapbox_amplify/app/modules/home/controllers/home_validation_controller.dart';

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
