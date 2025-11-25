import 'package:smart/core/network/api_response.dart';
import 'package:smart/features/auth/login/data/data_source/login_remote_ds_interface.dart';
import 'package:smart/features/auth/login/domain/repository/login_repository_interface.dart';

class LoginRepository extends LoginRepositoryInterface {
  final LoginRemoteDsInterface loginRemoteDsInterface;
  LoginRepository({required this.loginRemoteDsInterface});
  @override
  Future<ApiResponse> login({required Map<String, dynamic> data}) {
    try {
      return loginRemoteDsInterface.login(data: data);
    } catch (e) {
      rethrow;
    }
  }
}
