import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../data/auth_repository.dart';
import '../data/remote/auth_remote_data_source.dart';

/// Provide Dio globally
final dioProvider = Provider((ref) => DioClient().dio);

/// Remote data source (requires Dio)
final authRemoteProvider = Provider(
      (ref) => AuthRemoteDataSource(ref.read(dioProvider)),
);

/// Repository (requires Remote source)
final authRepositoryProvider = Provider(
      (ref) => AuthRepository(ref.read(authRemoteProvider)),
);
