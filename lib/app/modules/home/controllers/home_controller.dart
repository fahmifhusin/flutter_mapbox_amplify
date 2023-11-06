part of home_lib;

class HomeController extends GetxController {
  var _currentPosition = '...'.obs;
  var _currentLatitude = '...'.obs;
  var _currentLongitude = '...'.obs;
  double _currentPickupLatitude = 0.0;
  double _currentPickupLongitude = 0.0;
  double _currentDestinationLatitude = 0.0;
  double _currentDestinationLongitude = 0.0;
  CountDistanceService service = CountDistanceService();

  bool _isPickup = false;
  MapboxMap? mapboxMap;

  PointAnnotationManager? destinationPointAnnotationManager;
  PointAnnotation? destinationPointAnnotation;

  PointAnnotationManager? pickupPointAnnotationManager;
  PointAnnotation? pickupPointAnnotation;

  PolylineAnnotation? polylineAnnotation;
  PolylineAnnotationManager? polylineAnnotationManager;

  Future<void> _createMarker(
      {required double latitude,
      required double longitude,
      required PointAnnotationManager? poam}) async {
    final ByteData bytes =
        await rootBundle.load(assetsConstant.imgMapboxMarker);
    final Uint8List list = bytes.buffer.asUint8List();
    poam
        ?.create(PointAnnotationOptions(
          geometry: Point(
              coordinates: Position(
            longitude,
            latitude,
          )).toJson(),
          iconSize: 1,
          iconOffset: [0.0, -10.0],
          symbolSortKey: 10,
          image: list,
          textField:
              _isPickup ? stringConstant.pickup : stringConstant.destination,
          textSize: dimensionConstant.spacing16,
        ))
        .then((value) => isPickup
            ? pickupPointAnnotation = value
            : destinationPointAnnotation = value);
    update();
  }

  void setWaypoint({required coordinates}){
    List<Position> coordinatesData = [];
    for (int i = 0; i < coordinates.length; i++) {
      coordinatesData.add(Position(coordinates[i][0], coordinates[i][1]));
    }
    polylineAnnotationManager
        ?.create(PolylineAnnotationOptions(
        geometry: LineString(coordinates: coordinatesData).toJson(),
        lineColor: Colors.blueAccent.value,
        lineWidth: 3))
        .then((value) => polylineAnnotation = value);
    update();
    Get.back();
  }

  void onMapboxCreated(MapboxMap controllerMapbox) async {
    mapboxMap = controllerMapbox;
    setCurrentLocation();
    mapboxMap?.annotations.createPolylineAnnotationManager().then((value) {
      polylineAnnotationManager = value;
    });
  }

  // OnPolylineAnnotationClickListener? listener;

  void setPickupPoint({required double latitude, required double longitude}) {
    _currentPickupLatitude = latitude;
    _currentPickupLongitude = longitude;
    if (pickupPointAnnotationManager == null) {
      mapboxMap?.annotations.createPointAnnotationManager().then((value) async {
        pickupPointAnnotationManager = value;
        _createMarker(
                latitude: latitude,
                longitude: longitude,
                poam: pickupPointAnnotationManager)
            .whenComplete(() => update());
      });
    } else {
      var newPoint = Point(coordinates: Position(longitude, latitude));
      pickupPointAnnotation?.geometry = newPoint.toJson();
      pickupPointAnnotationManager?.update(pickupPointAnnotation!);
      update();
    }
  }

  void changeStatusPinpoint() {
    _isPickup = !_isPickup;
    update();
  }

  void setDestinationPoint(
      {required double latitude, required double longitude}) {
    _currentDestinationLatitude = latitude;
    _currentDestinationLongitude = longitude;
    if (destinationPointAnnotationManager == null) {
      mapboxMap?.annotations.createPointAnnotationManager().then((value) async {
        destinationPointAnnotationManager = value;
        _createMarker(
                latitude: latitude,
                longitude: longitude,
                poam: destinationPointAnnotationManager)
            .whenComplete(() => update());
      });
    } else {
      var newPoint = Point(coordinates: Position(longitude, latitude));
      destinationPointAnnotation?.geometry = newPoint.toJson();
      destinationPointAnnotationManager?.update(destinationPointAnnotation!);
      update();
    }
  }

  void setCurrentLocation() async {
    Get.back();
    mapboxMap?.location
        .updateSettings(LocationComponentSettings(enabled: true));
    mapboxMap?.setCamera(CameraOptions(
      center: Point(
          coordinates: Position(
        currentLongitude,
        currentLatitude,
      )).toJson(),
      zoom: dimensionConstant.spacing18,
    ));
  }

  void setLocationData() {
    _currentPosition.value = Get.arguments[argument.currentLocation];
    _currentLatitude.value = Get.arguments[argument.latitudeData];
    _currentLongitude.value = Get.arguments[argument.longitudeData];
  }

  bool get isPickup => _isPickup;

  String get currentPosition => _currentPosition.value;

  double get currentLatitude => double.parse(_currentLatitude.value);

  double get currentLongitude => double.parse(_currentLongitude.value);

  double get currentPickupLatitude => _currentPickupLatitude;

  double get currentPickupLongitude => _currentPickupLongitude;

  double get currentDestinationLatitude => _currentDestinationLatitude;

  double get currentDestinationLongitude => _currentDestinationLongitude;

  void countDistance({required Map<String, dynamic> dataCoordinates}) {
    service.requestLocationDistance({
      argument.latitudeData: dataCoordinates[argument.latitudeData],
      argument.longitudeData: dataCoordinates[argument.longitudeData],
      argument.latitudeData2: dataCoordinates[argument.latitudeData2],
      argument.longitudeData2: dataCoordinates[argument.longitudeData2],
    })?.then(
      (value) => setWaypoint(coordinates: value.routes![0].geometry!.coordinates),
    );
  }

  showDialogCountDistance() {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: dimensionConstant.spacing12,
            horizontal: dimensionConstant.spacing16,
          ),
          decoration: BoxDecoration(
            color: colorConstant.naturalWhite,
            borderRadius: BorderRadius.circular(dimensionConstant.spacing8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                stringConstant.countDistance,
                style: styleConstant.Text18Heading2(),
              ),
              SizedBox(
                height: dimensionConstant.spacing10,
              ),
              generalButtons.PrimaryButton(
                function: () => countDistance(dataCoordinates: {
                  argument.latitudeData: currentLatitude,
                  argument.longitudeData: currentLongitude,
                  argument.latitudeData2: currentPickupLatitude,
                  argument.longitudeData2: currentPickupLongitude,
                }),
                btnTitle: stringConstant.currentLocationToPickup,
              ),
              generalButtons.PrimaryButton(
                function: () => countDistance(dataCoordinates: {
                  argument.latitudeData: currentLatitude,
                  argument.longitudeData: currentLongitude,
                  argument.latitudeData2: currentDestinationLatitude,
                  argument.longitudeData2: currentDestinationLongitude,
                }),
                btnTitle: stringConstant.currentLocationToDestination,
              ),
              generalButtons.PrimaryButton(
                function: () => countDistance(dataCoordinates: {
                  argument.latitudeData: currentPickupLatitude,
                  argument.longitudeData: currentPickupLongitude,
                  argument.latitudeData2: currentDestinationLatitude,
                  argument.longitudeData2: currentDestinationLongitude,
                }),
                btnTitle: stringConstant.pickupToDestination,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    setLocationData();
    super.onInit();
  }
}
