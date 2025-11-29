class ApiEndpoints {
  ApiEndpoints._internal();

  static final ApiEndpoints _instance = ApiEndpoints._internal();

  factory ApiEndpoints() => _instance;

  /// Base URL
  static const String baseUrl =
      "http://osbt062023-001-site43.ktempurl.com/api";

  // ============================
  // 🔐 AUTH
  // ============================
  static const String login = "$baseUrl/Auth/login";
  static const String refresh = "$baseUrl/Auth/refresh";
  static const String register = "$baseUrl/Auth/register";
  static const String logout = "$baseUrl/Auth/logout";

  // ---------- OTP ----------
  static const String verifyOtp = "$baseUrl/Otp/verify";
  static const String resendOtp = "$baseUrl/Otp/resend";
  static const String getLastActiveOtp = "$baseUrl/Otp/GetLastActiveOtp";


  // ---------- HOME / PARKING ----------
  static const String home = "$baseUrl/Home";
  static const String homeSearch = "$baseUrl/Home/Search";
  static const String parking = "$baseUrl/Parking";

  // ============================
  // 🧾 BOOKING
  // ============================
  static const String getReservations = "${baseUrl}Reservation/GetReservations";
  static const String getReservationById =
      "${baseUrl}Reservation/GetReservationById";
  static const String checkIn = "${baseUrl}Reservation/CheckIn";
  static const String checkOut = "${baseUrl}Reservation/CheckOut";

  // ============================
  // 🚘 PARKING AREAS
  // ============================
  static const String getParkingAreas = "${baseUrl}ParkingArea/GetParkingAreas";
  static const String getParkingAreaById =
      "${baseUrl}ParkingArea/GetParkingAreaById";

  // ============================
  // 👤 USER
  // ============================
  static const String updateProfile = "${baseUrl}User/UpdateProfile";
  static const String getProfile = "${baseUrl}User/GetProfile";

  // ============================
  // 💳 PAYMENTS
  // ============================
  static const String getPaymentMethods = "${baseUrl}Payment/GetPaymentMethods";
  static const String addPaymentMethod = "${baseUrl}Payment/AddPaymentMethod";
  static const String deletePaymentMethod =
      "${baseUrl}Payment/DeletePaymentMethod";

  // ============================
  // 🌐 LOOKUPS
  // ============================
  static const String getVehicleTypes = "${baseUrl}Lookup/GetVehicleTypes";
  static const String getCities = "${baseUrl}Lookup/GetCities";
}
