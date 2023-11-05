part of home_lib;

class HomeController extends GetxController {
  var _currentLatitude = 0.0.obs;
  var _currentLongitude = 0.0.obs;
  MapboxMapController? _controllerMapbox;

  void onMapboxCreated(MapboxMapController controllerMapbox){
    _controllerMapbox = controllerMapbox;
  }

  void setLocationData(){
    _currentLatitude.value = Get.arguments[argument.latitudeData];
    _currentLongitude.value = Get.arguments[argument.longitudeData];
  }
  double get currentLatitude => _currentLatitude.value;
  double get currentLongitude => _currentLongitude.value;


  @override
  void onInit(){
    setLocationData();
    super.onInit();
  }
}
