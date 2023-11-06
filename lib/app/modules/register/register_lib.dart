library register_lib;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constant/constants.dart';
import '../../routes/app_pages.dart';

///components
part 'components/card_sign_up.dart';
part 'components/card_sign_up_verification.dart';
///controllers
part 'controllers/register_controller.dart';
///views
part 'views/register_view.dart';