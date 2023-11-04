part of splash_lib;

class IconSplash extends GetView<SplashValidationController> {
  const IconSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => SizedBox(),
      onLoading: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetsConstant.imgSplash,
              fit: BoxFit.fill,
              width: dimensionConstant.spacing200,
              height: dimensionConstant.spacing200,
            ),
            SizedBox(
              height: dimensionConstant.spacing12,
            ),
            Text(
              stringConstant.msgLoadLocation,
              style: styleConstant.Text20Heading1(
                customColor: colorConstant.naturalWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
