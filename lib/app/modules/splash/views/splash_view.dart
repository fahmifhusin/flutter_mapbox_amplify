part of splash_lib;

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return styleConstant.GeneralAppPage(
        customAppBarColor: colorConstant.splashYellow,
        isDisableScroll: true,
        isEnableBack: false,
        pageColor: colorConstant.splashYellow,
        body: IconSplash());
  }
}
