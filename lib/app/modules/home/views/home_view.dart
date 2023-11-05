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
        // backgroundColor:
        //     F.title == stringConstant.development ? Colors.amber : Colors.green,
        backgroundColor: colorConstant.splashYellow,
        centerTitle: false,
      ),
      body: Obx(
        () => MapboxMap(
          accessToken: mapboxToken,
          initialCameraPosition: CameraPosition(
            zoom: dimensionConstant.spacing16,
            target: LatLng(controller.currentLatitude, controller.currentLongitude)
          ),
        )
        //     Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'current address : ${controller.currentPosition}',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Text(
        //           'latitude : ${controller.currentLatitude}',
        //           style: styleConstant.Text16Heading3(),
        //         ),
        //         Text(
        //           'longitude : ${controller.currentLongitude}',
        //           style: styleConstant.Text16Heading3(),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
