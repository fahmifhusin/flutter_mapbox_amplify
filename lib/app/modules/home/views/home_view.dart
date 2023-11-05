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
      body:  Stack(
        children: [
          MapWidget(
            onTapListener: (value)=>logger.d('coordinate : ${value.x}, ${value.y}'),
            onMapCreated: controller.onMapboxCreated,
              resourceOptions:
              ResourceOptions(accessToken: mapboxToken)),
          generalButtons.PrimaryButton(function: ()=>controller.setCurrentLocation(), btnTitle: 'tes current location')
        ],
      )
    );
  }
}
