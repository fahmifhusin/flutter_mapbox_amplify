import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'app/constant/constants.dart';
import 'app/routes/app_pages.dart';
import 'flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.development;
  await dotenv.load(fileName: environmentPath.development);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: generalKeys.roboto),
    ),
  );
}
