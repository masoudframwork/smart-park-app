class ApiEndpoints {
  ApiEndpoints._internal();

  static final ApiEndpoints _instance = ApiEndpoints._internal();

  factory ApiEndpoints() => _instance;

  static const String _baseUrl =
      "http://osbt062023-001-site43.ktempurl.com/api/";

  static final loginEndpoint = "${_baseUrl}Auth/login";
}
