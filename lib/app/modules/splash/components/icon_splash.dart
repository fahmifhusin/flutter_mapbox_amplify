part of splash_lib;

class IconSplash extends GetView<SplashValidationController> {
  const IconSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
          (_) => SizedBox(),
      onLoading: Center(
        child: Image.asset(
          assetsConstant.imgSplash,
          fit: BoxFit.fill,
          width: dimensionConstant.spacing200,
          height: dimensionConstant.spacing200,
        ),
      ),
    );
  }
}
