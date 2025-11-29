import 'package:smart/core/network/api_response.dart';
import 'package:smart/core/usecaases/param_base_usecase.dart';
import '../repository/login_repository_interface.dart';

class LoginUsecases extends ParamBaseUseCase<ApiResponse> {
  final LoginRepositoryInterface loginRepository;
  LoginUsecases({required this.loginRepository});
  @override
  Future<ApiResponse> call({required Map<String, dynamic> data}) {
    try {
      return loginRepository.login(data: data);
    } catch (e) {
      //TODO: handle error
      rethrow;
    }
  }
}
