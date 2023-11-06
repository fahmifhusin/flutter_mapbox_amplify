part of shared_components;

class CustomField {
  static final CustomField _customField = CustomField._internal();

  CustomField._internal();

  factory CustomField() {
    return _customField;
  }

  Widget _BaseCustomField({
    bool isHidePassword = false,
    required String title,
    required TextEditingController? teController,
    Function(String)? onChange,
    required TextInputType inputType,
    required TextInputAction inputAction,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: dimensionConstant.spacing10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styleConstant.Text14Body1(
              isSemiBold: true,
            ),
          ),
          SizedBox(
            height: dimensionConstant.spacing8,
          ),
          SizedBox(
            height: dimensionConstant.spacing52,
            child: TextField(
              onChanged: onChange,
              controller: teController,
              maxLines: 1,
              obscureText: isHidePassword,
              keyboardType: inputType,
              textInputAction: inputAction,
              inputFormatters: inputType == TextInputType.number
                  ? [
                FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
              ]
                  : [],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 2, color: colorConstant.splashYellow),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      dimensionConstant.spacing10,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: colorConstant.splashYellow),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      dimensionConstant.spacing10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget FieldText({
    required String title,
    TextEditingController? teController,
    Function(String)? onChange,
    TextInputType inputType = TextInputType.text,
    TextInputAction inputAction = TextInputAction.next,
    bool isNumber = false,
  }) {
    return _BaseCustomField(
      title: title,
      teController: teController,
      onChange: onChange,
      inputAction: inputAction,
      inputType: inputType,
    );
  }

  Widget FieldPassword({
    required String title,
    TextEditingController? teController,
    Function(String)? onChange,
    TextInputType inputType = TextInputType.text,
    TextInputAction inputAction = TextInputAction.next,
  }) {
    return _BaseCustomField(
      title: title,
      isHidePassword: true,
      teController: teController,
      onChange: onChange,
      inputAction: inputAction,
      inputType: inputType,
    );
  }
}
