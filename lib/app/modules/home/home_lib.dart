library home_lib;

import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_amplify/app/constant/constants.dart';
import 'package:flutter_mapbox_amplify/app/modules/home/services/count_distance_service.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../flavors.dart';
import '../../routes/app_pages.dart';
///components
part 'components/component.dart';
///controllers
part 'controllers/home_controller.dart';
part 'controllers/home_navigation_controller.dart';
part 'controllers/home_validation_controller.dart';
///views
part 'views/home_view.dart';