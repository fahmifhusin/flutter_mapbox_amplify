part of constants;

class StringConstant{
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }

  final String development = 'Development';
  final String production = 'Production';
  final String appName = 'Map Box';
  final String msgLoadLocation = 'Getting your location...';
}
