class AppConstants {
  static const int paddingVertical = 20;
  static const int paddingHorizontal  = 16;
  static const String appName = "My Flutter App";
  static const String apiBaseUrl = "https://api.example.com";
  static const String tokenKey = "auth_token";

  // Keys for shared preferences
  static const String prefUserId = "user_id";
  static const String prefThemeMode = "theme_mode";

  // Routes
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String profileRoute = "/profile";

  // Error messages
  static const String errorNetwork = "Không có kết nối mạng.";
  static const String errorUnknown = "Đã xảy ra lỗi, vui lòng thử lại.";
}
