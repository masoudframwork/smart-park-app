import 'package:dio/dio.dart';
import 'package:smart/core/constants/api_endpoints.dart';
import 'package:smart/core/network/api_response.dart';
import 'package:smart/core/network/dio_client.dart';
import 'package:smart/features/auth/login/data/data_source/login_remote_ds_interface.dart';
import 'package:smart/features/auth/login/data/models/auth_model.dart';

class LoginRemoteDs extends LoginRemoteDsInterface {
  final DioClient dioClient;

  LoginRemoteDs({required this.dioClient});
  @override
  Future<ApiResponse> login({required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.post(
        ApiEndpoints.loginEndpoint,
        data: data,
        fromJson: (json) => AuthModel.fromJson(json),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      return response;
    } catch (e) {
      return ApiResponse.failure(e.toString());
    }
  }
}
