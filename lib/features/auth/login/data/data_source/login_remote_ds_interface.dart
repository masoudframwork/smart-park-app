import 'package:smart/core/network/api_response.dart';

abstract class LoginRemoteDsInterface {
  Future<ApiResponse> login({required Map<String, dynamic> data});
}
