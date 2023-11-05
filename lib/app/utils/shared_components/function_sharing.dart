part of shared_components;

class FunctionSharing {
  static final FunctionSharing _functionSharing = FunctionSharing._internal();

  FunctionSharing._internal();

  factory FunctionSharing() {
    return _functionSharing;
  }

  final Location _location = Location();

  Future<LocationData> get location async => await _location.getLocation();

  Future<PermissionStatus> get _loadStatus async =>
      await _location.hasPermission();

  Future<bool> isLocationPermanentlyDenied() async {
    PermissionStatus status = await _loadStatus;
    return status == PermissionStatus.deniedForever;
  }

  Future<bool> isLocationGranted() async {
    PermissionStatus status = await _loadStatus;
    return status == PermissionStatus.granted;
  }
}
