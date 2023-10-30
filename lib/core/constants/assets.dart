class Assets {
  Assets._();
  static final Assets _instance = Assets._();
  factory Assets() => _instance;

  ///
  static const String _icon = "assets/icons";
  static const String _image = "assets/images";

  /// [ ICON ]
  String get play => "$_icon/play.png";

  /// [ IMAGE]
  String get error => "$_image/error.png";
}
