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


}
