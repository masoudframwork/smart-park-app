import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://osbt062023-001-site43.ktempurl.com/api",
    connectTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20),
    headers: {
      "Content-Type": "application/json",
    },
  ),
);
