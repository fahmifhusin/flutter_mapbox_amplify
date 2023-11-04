import 'package:dio/dio.dart';

class DioSetup{
  static final DioSetup _dioSetup = DioSetup._internal();

  DioSetup._internal();

  factory DioSetup() {
    return _dioSetup;
  }

  Dio instanceDio = Dio();
  var generalHeaders = Options(headers:{
    "Accept": "text/plain",
    "Content-Type": "application/json"
  });
}