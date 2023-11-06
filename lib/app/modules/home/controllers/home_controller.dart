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
  String _waypointFrom = '';
  String _waypointTo = '';
  double _distance = 0.0;

  bool _isPickup = false;
  MapboxMap? _mapboxMap;

  PointAnnotationManager? _destinationPointAnnotationManager;
  PointAnnotation? _destinationPointAnnotation;

  PointAnnotationManager? _pickupPointAnnotationManager;
  PointAnnotation? _pickupPointAnnotation;

  PolylineAnnotation? _polylineAnnotation;
  PolylineAnnotationManager? _polylineAnnotationManager;

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
            ? _pickupPointAnnotation = value
            : _destinationPointAnnotation = value);
    update();
  }

  void setWaypoint({required coordinates}) {
    List<Position> coordinatesData = [];
    for (int i = 0; i < coordinates.length; i++) {
      coordinatesData.add(Position(coordinates[i][0], coordinates[i][1]));
    }
    if (_polylineAnnotation != null) {
      var newlineString = LineString(coordinates: coordinatesData);
      _polylineAnnotation?.geometry = newlineString.toJson();
      _polylineAnnotationManager?.update(_polylineAnnotation!);
    } else {
      _polylineAnnotationManager
          ?.create(PolylineAnnotationOptions(
              geometry: LineString(coordinates: coordinatesData).toJson(),
              lineColor: Colors.blueAccent.value,
              lineWidth: 3))
          .then((value) => _polylineAnnotation = value);
    }

    update();
    Get.back();
  }

  void onMapboxCreated(MapboxMap controllerMapbox) async {
    _mapboxMap = controllerMapbox;
    setCurrentLocation();
    _mapboxMap?.annotations.createPolylineAnnotationManager().then((value) {
      _polylineAnnotationManager = value;
    });
  }

  void setPickupPoint({required double latitude, required double longitude}) {
    _currentPickupLatitude = latitude;
    _currentPickupLongitude = longitude;
    if (_pickupPointAnnotationManager == null) {
      _mapboxMap?.annotations
          .createPointAnnotationManager()
          .then((value) async {
        _pickupPointAnnotationManager = value;
        _createMarker(
                latitude: latitude,
                longitude: longitude,
                poam: _pickupPointAnnotationManager)
            .whenComplete(() => update());
      });
    } else {
      var newPoint = Point(coordinates: Position(longitude, latitude));
      _pickupPointAnnotation?.geometry = newPoint.toJson();
      _pickupPointAnnotationManager?.update(_pickupPointAnnotation!);
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
    if (_destinationPointAnnotationManager == null) {
      _mapboxMap?.annotations
          .createPointAnnotationManager()
          .then((value) async {
        _destinationPointAnnotationManager = value;
        _createMarker(
                latitude: latitude,
                longitude: longitude,
                poam: _destinationPointAnnotationManager)
            .whenComplete(() => update());
      });
    } else {
      var newPoint = Point(coordinates: Position(longitude, latitude));
      _destinationPointAnnotation?.geometry = newPoint.toJson();
      _destinationPointAnnotationManager?.update(_destinationPointAnnotation!);
      update();
    }
  }

  void setCurrentLocation() async {
    Get.back();
    _mapboxMap?.location
        .updateSettings(LocationComponentSettings(enabled: true));
    _mapboxMap?.setCamera(CameraOptions(
      center: Point(
          coordinates: Position(
        currentLongitude,
        currentLatitude,
      )).toJson(),
      zoom: dimensionConstant.spacing18,
    ));
  }

  void setInitialLocationData() {
    _currentPosition.value = Get.arguments[argument.currentLocation];
    _currentLatitude.value = Get.arguments[argument.latitudeData];
    _currentLongitude.value = Get.arguments[argument.longitudeData];
  }

  void countDistance({required Map<String, dynamic> dataCoordinates}) {
    service.requestLocationDistance({
      argument.latitudeData: dataCoordinates[argument.latitudeData],
      argument.longitudeData: dataCoordinates[argument.longitudeData],
      argument.latitudeData2: dataCoordinates[argument.latitudeData2],
      argument.longitudeData2: dataCoordinates[argument.longitudeData2],
    })?.then(
      (value) {
        setWaypoint(coordinates: value.routes![0].geometry!.coordinates);
        _waypointFrom = value.waypoints!.first.name!;
        _waypointTo = value.waypoints!.last.name!;
        _distance = functionSharing.getDistance(value.waypoints!.first.location!.last, value.waypoints!.first.location!.first, value.waypoints!.last.location!.last, value.waypoints!.last.location!.first);
      },
    );
  }

  bool get isPickup => _isPickup;

  String get currentPosition => _currentPosition.value;

  double get currentLatitude => double.parse(_currentLatitude.value);

  double get currentLongitude => double.parse(_currentLongitude.value);

  double get currentPickupLatitude => _currentPickupLatitude;

  double get currentPickupLongitude => _currentPickupLongitude;

  double get currentDestinationLatitude => _currentDestinationLatitude;

  double get currentDestinationLongitude => _currentDestinationLongitude;

  String get waypointFrom => _waypointFrom;

  String get waypointTo => _waypointTo;

  String get distance => '${_distance.toStringAsFixed(0)} ${stringConstant.meters}';

  bool get isRouteAvailable => _polylineAnnotation != null;

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
    setInitialLocationData();
    super.onInit();
  }
}
