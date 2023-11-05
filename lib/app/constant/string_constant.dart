part of constants;

class StringConstant{
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }
  ///env
  final String development = 'Development';
  final String production = 'Production';
  ///home
  final String appName = 'Map Box';
  final String countDistance = 'Count Distance';
  final String destination = 'Destination';
  final String msgErrorLocationDeny = 'Please allow permission from app settings';
  final String msgGetCurrentLocation = 'Get Current Location';
  final String msgLoadLocation = 'Getting your location...';
  final String msgMarkPoint = 'Switch to Mark';
  final String msgTitleErrorLocationDeny = 'Failed to get your location';
  final String pickup = 'Pick Up';
}
