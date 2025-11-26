import 'package:get_it/get_it.dart';
import 'package:smart/core/routing/app_route.dart';
import 'package:smart/features/auth/login/data/data_source/login_remote_ds.dart';
import 'package:smart/features/auth/login/data/data_source/login_remote_ds_interface.dart';
import 'package:smart/features/auth/login/data/repository/login_repository.dart';
import 'package:smart/features/auth/login/domain/repository/login_repository_interface.dart';

import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //login
  sl.registerLazySingleton<LoginRemoteDsInterface>(
      () => LoginRemoteDs(dioClient: sl()));
  sl.registerLazySingleton<LoginRepositoryInterface>(
      () => LoginRepository(loginRemoteDsInterface: sl()));

//app-config
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<AppRouter>(() => AppRouter());
}
