import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/auth_usecase.dart';
import '../../../../main.dart';

part 'auth_state.dart';

/// https://youtu.be/_E3EF1jPumM?si=HVcf7QQSA7Q1SwcN&t=21554
@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignInWithKakao signInWithKakao,
    required GetKakaoUserInfo getKakaoUserInfo,
  })  : _signInWithKakao = signInWithKakao,
        _getKakaoUserInfo = getKakaoUserInfo,
        super(const AuthInitial());

  final SignInWithKakao _signInWithKakao;
  final GetKakaoUserInfo _getKakaoUserInfo;

  Future<void> isAuthenticated() async {
    final token = localStorage.getString('com.kakao.token.OAuthToken');

    if (token != null && token.isNotEmpty) {
      if (state is OauthUnAuthenticated) {
        return;
      } else {
        emit(const OauthAuthenticated());
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
      (success) => emit(const OauthAuthenticated()),
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
}

/*
* cubit
* no event.
* */
