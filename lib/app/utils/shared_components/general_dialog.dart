part of shared_components;

class GeneralDialog {
  static final GeneralDialog _generalDialog = GeneralDialog._internal();

  GeneralDialog._internal();

  factory GeneralDialog() {
    return _generalDialog;
  }
}
