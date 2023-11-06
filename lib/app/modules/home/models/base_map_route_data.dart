import 'dart:convert';

import 'package:flutter_mapbox_amplify/app/modules/home/models/route.dart';
import 'package:flutter_mapbox_amplify/app/modules/home/models/waypoint.dart';

class BaseMapRouteData {
  final List<Route>? routes;
  final List<Waypoint>? waypoints;
  final String? code;
  final String? uuid;

  BaseMapRouteData({
    this.routes,
    this.waypoints,
    this.code,
    this.uuid,
  });

  factory BaseMapRouteData.fromRawJson(String str) => BaseMapRouteData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseMapRouteData.fromJson(Map<String, dynamic> json) => BaseMapRouteData(
    routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
    waypoints: json["waypoints"] == null ? [] : List<Waypoint>.from(json["waypoints"]!.map((x) => Waypoint.fromJson(x))),
    code: json["code"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "routes": routes == null ? [] : List<dynamic>.from(routes!.map((x) => x.toJson())),
    "waypoints": waypoints == null ? [] : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
    "code": code,
    "uuid": uuid,
  };
}