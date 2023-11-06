part of login_lib;

class LoginController extends GetxController {
  TextEditingController tecEmailOrPhone = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  bool _isLoading = false;

  void setPageLoading({required bool value}){
    _isLoading = value;
    update();
  }

  bool get isSignInDataIsValid =>
      tecEmailOrPhone.text != '' && tecPassword.text != '';

  void verifySignUpForm() {
    isSignInDataIsValid ? true : false;
  }

  void clearFieldSignIn(){
    tecEmailOrPhone.text = '';
    tecPassword.text = '';
  }

  Future<void> doSignIn() async {
    if (isSignInDataIsValid) {
      ///load api
      setPageLoading(value: true);
      try {
        await Amplify.Auth.signIn(
            username: tecEmailOrPhone.text, password: tecPassword.text)
            .then((value) {
          logger.d('result is :${value}');
          setPageLoading(value: false);
          gotoDashboardAfterLogin();
        });
      } on AuthErrorResult catch (e) {
        setPageLoading(value: false);
        generalDialog.showGeneralSnackbar(title: stringConstant.error, msg: e.exception.message);
      } catch (e) {
        logger.d('error nya : ${e}');
        setPageLoading(value: false);
        String errMsg = e
            .toString()
            .split('"message":')[1]
            .split(',')[0]
            .replaceAll('"', '');
        generalDialog.showGeneralSnackbar(title: stringConstant.error, msg: errMsg != '' ? errMsg : stringConstant.generalMsgError);
      }
    }
  }

  void gotoSignupFromLogin() {
    Get.offNamed(Routes.REGISTER);
  }

  void gotoDashboardAfterLogin() {
    Get.back();
  }
}
