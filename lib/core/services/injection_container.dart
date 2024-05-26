import 'package:get_it/get_it.dart';

import '../../data/index.dart';
import '../../domain/index.dart';
import '../../presentation/pages/sign_up/auth_cubit.dart';

final sl = GetIt.instance;

/// https://youtu.be/_E3EF1jPumM?si=LvQDw7AB921bVjoZ&t=23561
/// initialize every dependency
Future<void> init() async {
  /// invoke service locator
  sl
    // app logic
    ..registerFactory(() => AuthCubit(sendUserCredentials: sl()))

    // usecase
    ..registerLazySingleton(() => SendUserCredentials(sl()))

    // repository
    ..registerLazySingleton<UserCredentialRepository>(
        () => UserCredentialRepositoryImpl(sl()))

    // datasource
    ..registerLazySingleton<UserCredentialDataSource>(
        () => UserCredentialDataSourceImpl(sl()))

    // external dependencies
    ..registerLazySingleton(() => DioClient.instance);

  /// register dependencies
  /// when we use the same variable(sl in this case) over and over again, can use cascade operator in dart.
  /// https://youtu.be/_E3EF1jPumM?si=-Ts70zb3D2LAde4F&t=23707
}
