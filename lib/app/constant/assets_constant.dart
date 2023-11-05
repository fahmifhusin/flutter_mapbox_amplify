part of constants;
class AssetsConstant{

  static final AssetsConstant _assetsConstant = AssetsConstant._internal();

  AssetsConstant._internal();

  factory AssetsConstant() {
    return _assetsConstant;
  }

  final String imgSplash = 'assets/images/ic_mapbox_splash.png';
  final String imgMapboxMarker = 'assets/img_mapbox_marker.png';

}
