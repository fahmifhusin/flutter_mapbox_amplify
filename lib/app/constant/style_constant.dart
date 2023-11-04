part of constants;

class StyleConstant {
  static final StyleConstant _styleConstant = StyleConstant._internal();

  StyleConstant._internal();

  factory StyleConstant() {
    return _styleConstant;
  }

  Widget GeneralAppPage(
      {required Widget body,
        bool isDisableScroll = false,
        Color? customAppBarColor,
        bool isEnableBack = true,
        Function? customFunctionBack,
        Color? pageColor}) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: customAppBarColor != null && customAppBarColor != colorConstant.naturalWhite && !Platform.isIOS
          ? SystemUiOverlayStyle(
        statusBarColor: customAppBarColor,
        statusBarBrightness: Brightness.light,
      )
          : SystemUiOverlayStyle.dark,
      child: WillPopScope(
        onWillPop: () async {
          if (customFunctionBack != null) {
            customFunctionBack;
          }
          return isEnableBack;
        },
        child: SafeArea(
            child: Scaffold(
              backgroundColor: pageColor,
              body: isDisableScroll ? body : SingleChildScrollView(child: body),
            )),
      ),
    );
  }
}
