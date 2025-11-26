import 'package:smart/core/network/api_response.dart';

abstract class LoginRepositoryInterface {
  Future<ApiResponse> login({required Map<String, dynamic> data});
}
