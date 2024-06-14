// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:partyguam/data/config/dio.dart' as _i3;
import 'package:partyguam/data/datasources/remote/auth_datasource.dart' as _i4;
import 'package:partyguam/data/datasources/remote/user_datasource.dart' as _i8;
import 'package:partyguam/data/index.dart' as _i7;
import 'package:partyguam/data/repositories/auth_respository_impl.dart' as _i6;
import 'package:partyguam/data/repositories/user_repository_impl.dart' as _i9;
import 'package:partyguam/domain/index.dart' as _i5;
import 'package:partyguam/domain/usecases/auth_usecase.dart' as _i11;
import 'package:partyguam/domain/usecases/user_usecase.dart' as _i10;
import 'package:partyguam/presentation/providers/cubit/auth_cubit.dart' as _i14;
import 'package:partyguam/presentation/providers/cubit/user_cubit.dart' as _i12;
import 'package:partyguam/presentation/providers/cubit/user_form_cubit.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DioClient>(() => _i3.DioClient());
    gh.lazySingleton<_i4.AuthDataSource>(() => _i4.AuthDataSourceImpl());
    gh.lazySingleton<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(gh<_i7.AuthDataSource>()));
    gh.lazySingleton<_i8.UserDataSource>(
        () => _i8.UserDataSourceImpl(gh<_i7.DioClient>()));
    gh.lazySingleton<_i5.UserSignUpRepository>(
        () => _i9.UserSignUpRepositoryImpl(gh<_i7.UserDataSource>()));
    gh.factory<_i10.SendUserCredentials>(
        () => _i10.SendUserCredentials(gh<_i5.UserSignUpRepository>()));
    gh.factory<_i10.CheckUserNickname>(
        () => _i10.CheckUserNickname(gh<_i5.UserSignUpRepository>()));
    gh.factory<_i10.CreateUser>(
        () => _i10.CreateUser(gh<_i5.UserSignUpRepository>()));
    gh.factory<_i11.SignInWithKakao>(
        () => _i11.SignInWithKakao(gh<_i5.AuthRepository>()));
    gh.factory<_i11.GetKakaoUserInfo>(
        () => _i11.GetKakaoUserInfo(gh<_i5.AuthRepository>()));
    gh.factory<_i12.UserCubit>(() => _i12.UserCubit(
          checkUserNickname: gh<_i5.CheckUserNickname>(),
          sendUserCredentials: gh<_i5.SendUserCredentials>(),
          dioClient: gh<_i7.DioClient>(),
        ));
    gh.factory<_i13.UserFormCubit>(
        () => _i13.UserFormCubit(createUser: gh<_i5.CreateUser>()));
    gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(
          signInWithKakao: gh<_i11.SignInWithKakao>(),
          getKakaoUserInfo: gh<_i11.GetKakaoUserInfo>(),
        ));
    return this;
  }
}
