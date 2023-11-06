part of register_lib;

class CardSignUpVerification extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (controller) => Obx(()=> Wrap(
          children: [
            Text(
              '${stringConstant.hi} ${controller.tecEmail.text}',
              style: styleConstant.Text22Heading1(
                  customColor: colorConstant.splashYellow),
            ),
            customField.FieldText(
                title: stringConstant.verificationCode,
                teController: controller.tecVerifCode,
                inputType: TextInputType.number,
                onChange: (_) => controller.isVerifyFieldIsPassed()),
            generalButtons.PrimaryButton(
              isActive: !controller.isLoading && controller.isVerifyFieldIsPassed(),
              isLoading: controller.isLoading,
              function: () => controller.verifyCodeSignUp(),
              btnTitle: stringConstant.verifySignUp,
            ),
            Container(
              height: dimensionConstant.spacing20,
              width: Get.width,
            ),
          ],
        )));
  }
}
