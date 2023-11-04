part of shared_components;

class GeneralKeyAndSharedPrefs {
  static final GeneralKeyAndSharedPrefs _generalSharedPrefs = GeneralKeyAndSharedPrefs._internal();

  GeneralKeyAndSharedPrefs._internal();

  factory GeneralKeyAndSharedPrefs() {
    return _generalSharedPrefs;
  }

  late SharedPreferences prefsInstance;

  final String roboto = 'Roboto';
}
