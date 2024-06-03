import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:partyguam/main.dart';

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
    final token = localStorage.getString('com.kakao.token.OAuthToken');

    if (token != null && token.isNotEmpty) {
      if (state is UnAuthenticated) {
        return;
      } else {
        emit(const Authenticated());
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
      (success) => emit(const Authenticated()),
    );
  }

  Future<void> getKakaoUserInfo() async {
    final result = await _getKakaoUserInfo();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) {
        final uid = success?.id.toString();
        final email = success?.kakaoAccount?.email;

        emit(GetKakaoUserInfoComplete(uid: uid!, email: email));
      },
    );
  }

  Future<void> sendUserCredentials(String uid) async {
    /// set loading state
    // emit(const SendUserCredentialsPending());

    final idToken = localStorage.getString('idToken');

    /// invoke the usecase
    final result = await _sendUserCredentials(
        SendUserCredentialParams(uid: uid, idToken: idToken!));

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
