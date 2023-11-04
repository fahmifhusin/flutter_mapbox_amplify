import 'package:flutter_mapbox_amplify/app/constant/constants.dart';

enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return stringConstant.development;
      case Flavor.production:
        return stringConstant.production;
      default:
        return 'title';
    }
  }

}
