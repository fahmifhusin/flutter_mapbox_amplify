part of shared_components;

class GeneralAppbar {
  static final GeneralAppbar _generalAppbar = GeneralAppbar._internal();

  GeneralAppbar._internal();

  factory GeneralAppbar() {
    return _generalAppbar;
  }
}
