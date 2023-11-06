part of register_lib;

class CardSignUp extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (controller) => Obx(() => Wrap(
              children: [
                Text(
                  stringConstant.signUp,
                  style: styleConstant.Text22Heading1(
                      customColor: colorConstant.splashYellow),
                ),
                customField.FieldText(
                    title: stringConstant.email,
                    teController: controller.tecEmail,
                    inputType: TextInputType.emailAddress,
                    onChange: (_) => controller.isSignUpIsPassed()),
                customField.FieldPassword(
                    title: stringConstant.password,
                    teController: controller.tecPassword,
                    onChange: (_) => controller.isSignUpIsPassed()),
                customField.FieldPassword(
                    title: stringConstant.confirmPassword,
                    teController: controller.tecPasswordConfirm,
                    onChange: (_) => controller.isSignUpIsPassed()),
                generalButtons.PrimaryButton(
                    isActive:
                        !controller.isLoading && controller.isSignUpIsPassed(),
                    isLoading: controller.isLoading,
                    function: () => controller.doSignUp(),
                    btnTitle: stringConstant.signUp),
                Container(
                  height: dimensionConstant.spacing20,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: '${stringConstant.or}\n\n',
                        style: styleConstant.Text12SmallText(),
                        children: <TextSpan>[
                          TextSpan(
                            text: stringConstant.alreadyHaveAccount,
                            style: styleConstant.Text12SmallText(),
                          ),
                          TextSpan(
                              text: stringConstant.signIn,
                              style: styleConstant.Text12SmallText(
                                  customColor: Colors.lightBlue),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => controller.gotoSignInFromRegister())
                        ]),
                  ),
                ),
              ],
            )));
  }
}
