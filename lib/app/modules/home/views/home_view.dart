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
      body: GetBuilder(
        init: controller,
        builder: (controller) => MapWidget(
            onTapListener: (value) => controller.isPickup
                ? controller.setPickupPoint(
                    latitude: value.x, longitude: value.y)
                : controller.setDestinationPoint(
                    latitude: value.x, longitude: value.y),
            onMapCreated: controller.onMapboxCreated,
            resourceOptions: ResourceOptions(accessToken: mapboxToken)),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimensionConstant.spacing12,
            vertical: dimensionConstant.spacing8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder(
              init: controller,
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///set dari controller kalo ada waktu keneh
                  Text(
                    '${stringConstant.action} : Walking',
                    style: styleConstant.Text14Body1(
                      isSemiBold: true,
                    ),
                  ),
                  Text('${stringConstant.from} : ${controller.waypointFrom}'),
                  Text('${stringConstant.to} : ${controller.waypointTo}'),
                  Text('${stringConstant.distance} : ${controller.distance}'),
                  SizedBox(
                    height: dimensionConstant.spacing12,
                  ),
                  controller.isRouteAvailable
                      ? generalButtons.PrimaryButton(
                          customBtnColor: controller.trackLocation
                              ? colorConstant.redAutumn
                              : Colors.lightBlue,
                          function: () => controller.trackLocation
                              ? controller.stopMapNavigation()
                              : controller.startMapNavigation(),
                          btnTitle: controller.trackLocation
                              ? stringConstant.stopNavigation
                              : stringConstant.startNavigation,
                        )
                      : SizedBox()
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: generalButtons.PrimaryButton(
                        function: () => controller.setCurrentLocation(),
                        btnTitle: stringConstant.msgGetCurrentLocation)),
                SizedBox(
                  width: dimensionConstant.spacing20,
                ),
                Expanded(
                    child: generalButtons.PrimaryButton(
                        function: () => controller.showDialogCountDistance(),
                        btnTitle: stringConstant.countDistance))
              ],
            ),
            GetBuilder(
              init: controller,
              builder: (controller) => generalButtons.PrimaryButton(
                function: () => controller.changeStatusPinpoint(),
                btnTitle:
                    '${stringConstant.msgMarkPoint} ${controller.isPickup ? stringConstant.destination : stringConstant.pickup}',
              ),
            )
          ],
        ),
      ),
    );
  }
}
