import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/index.dart';
import '../../../../domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

/// https://youtu.be/_E3EF1jPumM?si=HVcf7QQSA7Q1SwcN&t=21554
@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignInWithKakao signInWithKakao,
    required GetKakaoUserInfo getKakaoUserInfo,
    required SendUserCredentials sendUserCredentials,
  })  : _signInWithKakao = signInWithKakao,
        _getKakaoUserInfo = getKakaoUserInfo,
        _sendUserCredentials = sendUserCredentials,
        super(const AuthInitial());

  final SignInWithKakao _signInWithKakao;
  final GetKakaoUserInfo _getKakaoUserInfo;
  final SendUserCredentials _sendUserCredentials;

  void isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('com.kakao.token.OAuthToken');

    if (token != null && token.isNotEmpty) {
      if (state is UnAuthenticatedStatus) {
        return;
      } else {
        emit(const AuthenticatedStatus());
      }
    } else {
      emit(const AuthInitial());
    }
  }

  void resetAuthenticationStatus() {
    emit(const AuthInitial());
  }

  Future<void> signInWithKakao() async {
    final result = await _signInWithKakao();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) => emit(const AuthenticatedStatus()),
    );
  }

  Future<User?> getKakaoUserInfo() async {
    emit(const UnAuthenticatedStatus());

    final result = await _getKakaoUserInfo();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) => emit(const GetKakaoUserInfoComplete()),
    );
  }

  Future<void> sendUserCredentials() async {
    /// set loading state
    emit(const SendUserCredentialsPending());

    /// invoke the usecase
    final result = await _sendUserCredentials();

    /// equatable syntax: result.fold(L,R)
    result.fold(
      (failure) => emit(AuthRegisteredToken(failure.signUpAccessToken)),
      (success) => emit(const SendUserCredentialsComplete()),
    );
  }
}

/*
* cubit
* no event.
* */
