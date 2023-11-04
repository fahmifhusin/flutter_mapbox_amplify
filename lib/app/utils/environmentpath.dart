class EnvironmentPath {
  static final EnvironmentPath _environmentPath = EnvironmentPath._internal();//contoh singleton kaya gini, biasanya buat fungsi yang share dan perlu instance atau manggil base url kalo base nya ada di dalem kelas

  factory EnvironmentPath() {
    return _environmentPath;
  }
  EnvironmentPath._internal();

  String development = "assets/environments/.env.development";
  String production = "assets/environments/.env.production";
}