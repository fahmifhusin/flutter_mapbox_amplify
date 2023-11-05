part of home_lib;


class HomeController extends GetxController {
  var _currentPosition = '...'.obs;
  var _currentLatitude = '...'.obs;
  var _currentLongitude = '...'.obs;
  MapboxMap? mapboxMap;
  // PointAnnotationManager? pointAnnotationManager;
  // PointAnnotation? pointAnnotation;

  // Future<void> _createMarker() async {
  //   final ByteData bytes =
  //       await rootBundle.load(assetsConstant.imgMapboxMarker);
  //   final Uint8List list = bytes.buffer.asUint8List();
  //
  //   pointAnnotationManager
  //       ?.create(PointAnnotationOptions(
  //           geometry: Point(
  //               coordinates: Position(
  //             currentLongitude,
  //             currentLatitude,
  //           )).toJson(),
  //           iconSize: 1.5,
  //           iconOffset: [0.0, -10.0],
  //           symbolSortKey: 10,
  //           image: list))
  //       .then((value) => pointAnnotation = value);
  // }

  void onMapboxCreated(MapboxMap controllerMapbox) async {
    mapboxMap = controllerMapbox;
    // mapboxMap?.annotations.createPointAnnotationManager().then((value) async {
    //   pointAnnotationManager = value;
    //   _createMarker();
    // });
  }

  void setCurrentLocation() async {
    mapboxMap?.location.updateSettings(LocationComponentSettings(enabled: true));
    mapboxMap?.setCamera(CameraOptions(
        center: Point(
            coordinates: Position(
              currentLongitude,
              currentLatitude,
            )).toJson(),
        zoom: dimensionConstant.spacing18,));
  }

  void setLocationData() {
    _currentPosition.value = Get.arguments[argument.currentLocation];
    _currentLatitude.value = Get.arguments[argument.latitudeData];
    _currentLongitude.value = Get.arguments[argument.longitudeData];
  }

  String get currentPosition => _currentPosition.value;

  double get currentLatitude => double.parse(_currentLatitude.value);

  double get currentLongitude => double.parse(_currentLongitude.value);

  @override
  void onInit() {
    setLocationData();
    super.onInit();
  }
}
