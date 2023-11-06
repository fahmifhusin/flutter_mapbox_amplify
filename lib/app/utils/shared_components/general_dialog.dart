part of shared_components;

class GeneralDialog {
  static final GeneralDialog _generalDialog = GeneralDialog._internal();

  GeneralDialog._internal();

  factory GeneralDialog() {
    return _generalDialog;
  }

  void showGeneralSnackbar(
      {required String title, required String msg, Color? customColor}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, msg,
        margin: EdgeInsets.all(
          dimensionConstant.spacing12,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:
            customColor != null ? customColor : colorConstant.splashYellow,
        colorText: colorConstant.naturalWhite);
  }
}
