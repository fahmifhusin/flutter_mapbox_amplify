part of shared_components;

class GeneralButtons {
  static final GeneralButtons _generalButtons = GeneralButtons._internal();

  GeneralButtons._internal();

  factory GeneralButtons() {
    return _generalButtons;
  }

  Widget _BaseGeneralButton(
      {required Function function,
        required String btnTitle,
        required bool isLoading,
        required bool isActive,
        Color? customBtnColor}) {
    return Padding(
      padding: EdgeInsets.only(
        top: dimensionConstant.spacing20,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: colorConstant.naturalWhite,
            backgroundColor: isActive
                ? customBtnColor != null
                ? customBtnColor
                : Colors.lightBlue
                : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  dimensionConstant.spacing10,
                ),
              ),
            ),
            minimumSize: Size(
              Get.width,
              dimensionConstant.spacing52,
            )),
        onPressed: () => function(),
        child: isLoading
            ? SizedBox(
          width: dimensionConstant.spacing16,
          height: dimensionConstant.spacing16,
          child: CircularProgressIndicator(
            color: colorConstant.naturalWhite,
          ),
        )
            : Text(btnTitle),
      ),
    );
  }

  Widget PrimaryButton({
    required Function function,
    required String btnTitle,
    bool isLoading = false,
    bool isActive = true,
    Color? customBtnColor,
  }) {
    return _BaseGeneralButton(
        function: function,
        btnTitle: btnTitle,
        isLoading: isLoading,
        isActive: isActive,
        customBtnColor: customBtnColor);
  }

}
