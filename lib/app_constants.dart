import 'package:temiwa/infrastructure/service/services.dart';

abstract class AppConstants {
  AppConstants._();

  static const bool isDemo = false;
  static const bool autoTrn = true;
  static const bool shopBadge = true;
  static const bool enableGame = true;
  static const SignUpType signUpType = SignUpType.both;

  /// api urls
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: "https://api.temiwa.com/");
  static const String webUrl = String.fromEnvironment('WEB_URL', defaultValue: "https://temiwa.com/");
  static const String adminPageUrl =  String.fromEnvironment('ADMIN_URL', defaultValue: "https://dev.temiwa.com/");
  static const String googleApiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY', defaultValue: "AIzaSyAbAKIZGxrlrDnb9g1R5L6dB6sQPHuHaJ0");
  static const String firebaseWebKey = String.fromEnvironment('FIREBASE_API_KEY', defaultValue: "AIzaSyBnyg4rjjOAsCqDuYYGZQBjp6RYn3DSa7Y");
  static const String urlPrefix = String.fromEnvironment('URL_PREFIX', defaultValue: "https://temiwa.page.link");
  static const String routingBaseUrl = String.fromEnvironment('ROUTING_API', defaultValue: "https://api.openrouteservice.org/");
  static const String routingKey = String.fromEnvironment('ROUTING_KEY', defaultValue: "5b3ce3597851110001cf62482a0a2a48818847b1b2560cead8287ea6");

  static const String androidPackageName = 'com.temiwa';
  static const String iosPackageName = 'com.temiwa';

  // PayFast
  static const String passphrase = String.fromEnvironment('PAYFAST_PASSPHRASE', defaultValue: "");
  static const String merchantId = String.fromEnvironment('PAYFAST_MERCHANT_ID', defaultValue: "");
  static const String merchantKey = String.fromEnvironment('PAYFAST_MERCHANT_KEY', defaultValue: "");

  /// auth phone fields
  static const bool isNumberLengthAlwaysSame = true;
  static const String countryCodeISO = 'NG';
  static const bool showFlag = true;
  static const bool showArrowIcon = true;

  static const double radius = 12;
  static const double radiusMax = 14;

  /// location
  static const double demoLatitude = 9.064477;
  static const double demoLongitude = 7.486209;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  ///refresh duration
  static const Duration timeRefresh = Duration(seconds: 30);

  ///image
  static const String darkBgChat = "assets/images/darkBg.jpeg";
  static const String lightBgChat = "assets/images/lightBg.jpeg";
}
