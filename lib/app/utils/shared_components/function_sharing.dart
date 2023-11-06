part of shared_components;

class FunctionSharing {
  static final FunctionSharing _functionSharing = FunctionSharing._internal();

  FunctionSharing._internal();

  factory FunctionSharing() {
    return _functionSharing;
  }

  Future<Position> get _position async => await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  Future<String> getCurrentCoordinate() async {
    Position positions = await _position;
    final coordinates =
    Coordinates(positions.latitude, positions.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var address = addresses.first;
    return address.addressLine??'-';
  }
  
  double getDistance(lat1, long1, lat2, long2) =>Geolocator.distanceBetween(lat1, long1, lat2, long2);

  Future<String> getLatitude() async {
    Position positions = await _position;
    final latitudeData = positions.latitude;
    return latitudeData.toString();
  }

  Future<String> getLongitude() async {
    Position positions = await _position;
    final longitudeData = positions.longitude;
    return longitudeData.toString();
  }

  Future<void> configureAmplifyInstance() async {
    final authPlugin = AmplifyAuthCognito();
    final datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    final apiPlugin = AmplifyAPI();
    await Amplify.addPlugins([apiPlugin,authPlugin,datastorePlugin]);
    try {
      await Amplify.configure(amplifyconfig).then((_){
        try{
          Amplify.Auth.signOut();
        }catch(_){
          logger.d('error because not login yet');
        }
      });
    } on AmplifyAlreadyConfiguredException {
      logger.d(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }catch(_){
      logger.d('error to configure');
    }
  }



  Future <AuthUser?> getUserData() async {
    AuthUser? userData;
    await Amplify.Auth.getCurrentUser().then((value) => userData = value);
    return userData;
  }


}
