part of 'auth_cubit.dart';

/// https://youtu.be/_E3EF1jPumM?si=Xm_4EGd-5xRZHBVF&t=20781
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

class OauthUnAuthenticated extends AuthState {
  const OauthUnAuthenticated();
}

class OauthAuthenticated extends AuthState {
  const OauthAuthenticated();
}

//
class GetKakaoUserInfoPending extends AuthState {
  const GetKakaoUserInfoPending();
}

class GetKakaoUserInfoComplete extends AuthState {
  const GetKakaoUserInfoComplete({
    required this.uid,
    this.email,
  });

  final String uid;
  final String? email;

  @override
  List<Object> get props => [uid];
}

class AuthRegisteredToken extends AuthState {
  const AuthRegisteredToken(this.registeredAccessToken);

  final String registeredAccessToken;

  @override
  List<String> get props => [registeredAccessToken];
}

class AuthError extends AuthState {
  const AuthError(this.message);

  // only need a message as it will be displayed on the screen
  final String message;

  @override
  List<String> get props => [message];
}
