class ApiEndpoints {
  ApiEndpoints._internal();

  static final ApiEndpoints _instance = ApiEndpoints._internal();

  factory ApiEndpoints() => _instance;
}
