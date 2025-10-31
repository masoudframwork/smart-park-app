class AppImages {
  AppImages._internal();

  static final AppImages _instance = AppImages._internal();

  factory AppImages() => _instance;
  //logo
  static const String appLogo = 'assets/images/Group 568@3x.png';
  //intro screen
  static const String intro1 = 'assets/images/intro1.jpg';
  static const String intro2 = 'assets/images/intro2.jpg';
  static const String intro3 = 'assets/images/intro3.jpg';
  // arraw icons
  static const String arrowIcon = 'assets/images/left-arrow.png';
  static const String bookingTab =
      'assets/images/bottom-nav-bar/booking-tab.svg';
  static const String homeTab = 'assets/images/bottom-nav-bar/home-tab.svg';
  static const String walletTab = 'assets/images/bottom-nav-bar/wallet-tab.svg';

  //home
  static const String parkingMarkers = "assets/images/home/marker.svg";
  static const String realSu = "assets/images/home/realSu.svg";
  static const String charging = "assets/images/home/cable.svg";
  static const String shower = "assets/images/home/shower.svg";
  static const String timeStop = "assets/images/home/timeStop.svg";
  static const String twoCars = "assets/images/home/twoCars.svg";

}
