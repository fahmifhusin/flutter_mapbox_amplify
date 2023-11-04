import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/home_lib.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/splash_lib.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
