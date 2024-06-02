part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  /// implement override in the parents so that you don't need to override everytime
  /// when you don't have fields (GET method)
  @override
  List<Object> get props => [];
}

class SendUserCredentialsEvent extends AuthEvent {
  const SendUserCredentialsEvent({
    required this.uid,
    required this.idToken,
  });

  final String uid;
  final String idToken;

  @override
  List<Object> get props => [uid, idToken];
}
