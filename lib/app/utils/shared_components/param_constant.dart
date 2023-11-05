part of shared_components;

class ParamConstant {
  static final ParamConstant _paramConstant = ParamConstant._internal();

  ParamConstant._internal();

  factory ParamConstant() {
    return _paramConstant;
  }

  final String currentLocation = 'currentLocation';
  final String latitudeData = 'latitudeData';
  final String longitudeData = 'longitudeData';

}