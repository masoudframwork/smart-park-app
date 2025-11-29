import 'package:get_it/get_it.dart';
import 'package:smart/core/routing/app_route.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //login
  // sl.registerLazySingleton<LoginRemoteDsInterface>(
  //     () => LoginRemoteDs(dioClient: sl()));
  // sl.registerLazySingleton<LoginRepositoryInterface>(
  //     () => LoginRepository(loginRemoteDsInterface: sl()));

//app-config
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<AppRouter>(() => AppRouter());
}
