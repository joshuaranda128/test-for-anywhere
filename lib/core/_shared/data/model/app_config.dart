class AppConfig {
  AppConfig({
    required this.flavorName,
    required this.baseUrl,
  });

  final String flavorName;
  final String baseUrl;

  String get getFlavorName => flavorName;

  String get getBaseUrl => baseUrl;
}
