class HttpStatusCodes {
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int serverError = 500;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
}

class NetworkTimeouts {
  static const Duration connect = Duration(seconds: 30);
  static const Duration receive = Duration(seconds: 30);
  static const Duration send = Duration(seconds: 30);
}