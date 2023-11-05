part of home_lib;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title == stringConstant.development
            ? '${stringConstant.appName} ${stringConstant.development}'
            : stringConstant.appName),
        backgroundColor: colorConstant.splashYellow,
        centerTitle: false,
      ),
      body: Obx(
        () => MapboxMap(
          onMapCreated: controller.
          onMapboxCreated,
          accessToken: mapboxToken,
          // myLocationEnabled: true,
          myLocationRenderMode: MyLocationRenderMode.NORMAL,
          myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
          initialCameraPosition: CameraPosition(
            zoom: dimensionConstant.spacing18,
            target: LatLng(controller.currentLatitude, controller.currentLongitude)
          ),
        ),
      ),
    );
  }
}
