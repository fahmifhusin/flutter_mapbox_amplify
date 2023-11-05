part of home_lib;

class HomeController extends GetxController {

  var _currentPosition = '...'.obs;
  var _currentLatitude = '...'.obs;
  var _currentLongitude = '...'.obs;

  String get currentPosition => _currentPosition.value;
  String get currentLatitude => _currentLatitude.value;
  String get currentLongitude => _currentLongitude.value;

  void setLocationData(){
    _currentPosition.value = Get.arguments[argument.currentLocation];
    _currentLatitude.value = Get.arguments[argument.latitudeData];
    _currentLongitude.value = Get.arguments[argument.longitudeData];
  }


  @override
  void onInit(){
    setLocationData();
    super.onInit();
  }
}
