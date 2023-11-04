part of home_lib;

class HomeController extends GetxController {

  var _currentPosition = '...'.obs;

  String get currentPosition => _currentPosition.value;

  @override
  void onInit(){
    functionSharing.getCurrentCoordinate().then((value) => _currentPosition.value = value);
    super.onInit();
  }
}
