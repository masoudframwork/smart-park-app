class AppRoutes {
  AppRoutes._internal();

  static final AppRoutes _instance = AppRoutes._internal();

  factory AppRoutes() => _instance;

  static AppRoutes get instance => _instance;

  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboardingScreen';

//riverpod_exam_fiel
  static const String examScreen = 'examScreen';
}
