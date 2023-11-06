part of register_lib;

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return styleConstant.GeneralAppPage(
      body: Stack(
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              decoration: BoxDecoration(
                  color: colorConstant.splashYellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(dimensionConstant.spacing16),
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
                  controller.isVerificationPage
                      ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                        '${stringConstant.headerSignUpVerification}\n',
                        style: styleConstant.Text22Heading1(
                            customHeight: 1.5,
                            customColor: colorConstant.naturalWhite),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            controller.tecEmail.text,
                            style: styleConstant.Text20Heading1(
                              customHeight: 1.5,
                            ),
                          ),
                        ]),
                  )
                      : Text(
                    stringConstant.headerSignUp,
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
                        child: GetBuilder(
                          init: controller,
                          builder: (controller)=>Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: dimensionConstant.spacing20,
                              horizontal: dimensionConstant.spacing16,
                            ),
                            child: controller.isVerificationPage
                                ? CardSignUpVerification()
                                : CardSignUp(),
                          )),
                        )
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
