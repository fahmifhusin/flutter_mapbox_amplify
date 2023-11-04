part of constants;

class ColorConstant {
  static final ColorConstant _colorConstant = ColorConstant._internal();

  ColorConstant._internal();

  factory ColorConstant() {
    return _colorConstant;
  }

  ///primary color pallete
  final Color splashYellow = Color(0xFFffc02b);

  ///secondary color pallete
  final Color naturalWhite = Color(0xFFFFFFFF);
  ///other color pallete

}
