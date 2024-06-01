import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:partyguam/domain/usecases/auth_usecase.dart';

import '../../../../domain/index.dart';

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

  Future<void> signInWithKakao() async {
    emit(const SignInWithKakaoPending());

    final result = await _signInWithKakao();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (success) => emit(const SignInWithKakaoComplete()),
    );
  }

  Future<void> getKakaoUserInfo() async {
    emit(const GetKakaoUserInfoPending());

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
