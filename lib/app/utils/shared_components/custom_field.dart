part of shared_components;

class CustomField {
  static final CustomField _customField = CustomField._internal();

  CustomField._internal();

  factory CustomField() {
    return _customField;
  }
}
