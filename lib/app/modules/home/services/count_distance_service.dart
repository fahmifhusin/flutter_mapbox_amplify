import 'package:flutter_mapbox_amplify/app/constant/constants.dart';


class CountDistanceService {
  Future<dynamic>? requestLocationDistance(Map<String, dynamic>? param) async {
    // try {
      final services = dioService.instanceDio;
      final String url = '$baseAppUrlMapbox/directions/v5/mapbox/walking/${param![argument.longitudeData]}, ${param[argument.latitudeData]};${param[argument.longitudeData2].toStringAsFixed(7)},${param[argument.latitudeData2].toStringAsFixed(7)}?geometries=geojson&access_token=$mapboxToken';
      logger.d('url : ${url}');
      final response = await services.get(
          url);
      logger.d('response : $response');
    // } catch (_) {
    //   logger.d('error');
    // }

    return null;
  }
}
