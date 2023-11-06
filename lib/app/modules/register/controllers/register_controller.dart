part of register_lib;

class RegisterController extends GetxController {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecPasswordConfirm = TextEditingController();
  TextEditingController tecVerifCode = TextEditingController();
  bool _isVerificationPage = false;
  bool _isLoading = false;
  var _isPassedSignup = false.obs;
  var _isPassedVerification = false.obs;

  void setPageLoading({required bool value}) {
    _isLoading = value;
    update();
  }

  bool get isVerificationPage => _isVerificationPage;

  bool get isLoading => _isLoading;

  bool isSignUpIsPassed() {
    _isPassedSignup.value = tecEmail.text != '' &&
        tecPassword.text != '' &&
        tecPasswordConfirm.text != '' &&
        tecPassword.text == tecPasswordConfirm.text;
    return _isPassedSignup.value;
  }

  bool isVerifyFieldIsPassed() {
    _isPassedVerification.value = tecVerifCode.text != '';
    return _isPassedVerification.value;
  }

  Future<void> doSignUp() async {
    if (isSignUpIsPassed() && !_isLoading) {
      setPageLoading(value: true);
      try {
        await Amplify.Auth.signUp(
          username: tecEmail.text,
          password: tecPassword.text,
          options: SignUpOptions(userAttributes: {
            AuthUserAttributeKey.email: tecEmail.text,
          }),
        ).then((value) {
          _isVerificationPage = true;
          logger.d('response : $value');
          setPageLoading(value: false);
        });
      } on AuthErrorResult catch (e) {
        setPageLoading(value: false);
        generalDialog.showGeneralSnackbar(
            title: stringConstant.error, msg: e.exception.message);
      } catch (e) {
        logger.d('error nya : ${e}');
        setPageLoading(value: false);
        String errMsg = e
            .toString()
            .split('"message":')[1]
            .split(',')[0]
            .replaceAll('"', '');
        generalDialog.showGeneralSnackbar(
            title: stringConstant.error,
            msg: errMsg != '' ? errMsg : stringConstant.generalMsgError);
      }
    }
  }

  Future<void> verifyCodeSignUp() async {
    if (isVerifyFieldIsPassed() && !_isLoading) {
      try {
        setPageLoading(value: true);
        await Amplify.Auth.confirmSignUp(
                username: tecEmail.text, confirmationCode: tecVerifCode.text)
            .then((value) {
          logger.d('result is :${value}');
          generalDialog.showGeneralSnackbar(
              title: stringConstant.verificationSuccess,
              msg: stringConstant.successVerify);
          setPageLoading(value: false);
          Get.back();
        });
      } on AuthErrorResult catch (e) {
        setPageLoading(value: false);
        generalDialog.showGeneralSnackbar(
            title: stringConstant.error, msg: e.exception.message);
      } catch (e) {
        logger.d('error nya : ${e}');
        setPageLoading(value: false);
        String errMsg = e
            .toString()
            .split('"message":')[1]
            .split(',')[0]
            .replaceAll('"', '');
        generalDialog.showGeneralSnackbar(
            title: stringConstant.error,
            msg: errMsg != '' ? errMsg : stringConstant.generalMsgError);
      }
    }
  }

  void gotoSignInFromRegister() {
    Get.offNamed(Routes.LOGIN);
  }

  void goBackToSignUp() {
    _isVerificationPage = false;
    update;
  }
}
