import 'package:get_it/get_it.dart';
import 'package:smart_park_app/core/routing/app_route.dart';

import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //main-screen

  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<AppRouter>(() => AppRouter());
}
