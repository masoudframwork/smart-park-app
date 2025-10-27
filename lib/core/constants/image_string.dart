class AppImages {
  AppImages._internal();

  static final AppImages _instance = AppImages._internal();

  factory AppImages() => _instance;
  //logo
  static const String appLogo = 'assets/images/logo.png';
  //intro screen
  static const String intro1 = 'assets/images/intro1.png';
  static const String intro2 = 'assets/images/intro2.png';
  static const String intro3 = 'assets/images/intro1.png';
  // arraw icons
  static const String arrowIcon = 'assets/images/left-arrow.png';
  static const String bookingTab =
      'assets/images/bottom-nav-bar/booking-tab.svg';
  static const String homeTab = 'assets/images/bottom-nav-bar/home-tab.svg';
  static const String walletTab = 'assets/images/bottom-nav-bar/wallet-tab.svg';
}
