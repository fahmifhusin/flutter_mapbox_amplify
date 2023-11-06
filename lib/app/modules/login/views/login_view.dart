part of login_lib;

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return styleConstant.GeneralAppPage(
      body: GetBuilder(
          init: controller,
          builder: (controller) => Stack(
                children: [
                  Container(
                    height: Get.height * 0.4,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: colorConstant.splashYellow,
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(dimensionConstant.spacing16),
                          bottomRight: Radius.circular(
                            dimensionConstant.spacing16,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        dimensionConstant.spacing16,
                        Get.height * 0.05,
                        dimensionConstant.spacing16,
                        dimensionConstant.spacing24),
                    child: Column(
                      children: [
                        Text(
                          stringConstant.signInHeader,
                          textAlign: TextAlign.center,
                          style: styleConstant.Text22Heading1(
                              customHeight: 1.5,
                              customColor: colorConstant.naturalWhite),
                        ),
                        SizedBox(
                          height: dimensionConstant.spacing20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  dimensionConstant.spacing10,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: dimensionConstant.spacing20,
                                horizontal: dimensionConstant.spacing16,
                              ),
                              child: Obx(
                                () => Wrap(
                                  children: [
                                    Text(
                                      stringConstant.signIn,
                                      style: styleConstant.Text22Heading1(
                                          customColor:
                                              colorConstant.splashYellow),
                                    ),
                                    customField.FieldText(
                                      title: stringConstant.emailOrPhone,
                                      teController: controller.tecEmailOrPhone,
                                      onChange: (_) =>
                                          controller.isSignInDataIsValid(),
                                    ),
                                    customField.FieldPassword(
                                      title: stringConstant.password,
                                      teController: controller.tecPassword,
                                      onChange: (_) =>
                                          controller.isSignInDataIsValid(),
                                    ),
                                    generalButtons.PrimaryButton(
                                      isActive: !controller.isLoading &&
                                          controller.isSignInDataIsValid(),
                                      isLoading: controller.isLoading,
                                      function: () => controller.doSignIn(),
                                      btnTitle: stringConstant.signIn,
                                    ),
                                    Container(
                                      height: dimensionConstant.spacing20,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: '${stringConstant.or}\n\n',
                                            style:
                                                styleConstant.Text12SmallText(),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: stringConstant
                                                    .dontHaveAccount,
                                                style: styleConstant
                                                    .Text12SmallText(),
                                              ),
                                              TextSpan(
                                                text: stringConstant.signUp,
                                                style: styleConstant
                                                    .Text12SmallText(
                                                        customColor:
                                                            Colors.lightBlue),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () => controller
                                                          .gotoSignupFromLogin(),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
