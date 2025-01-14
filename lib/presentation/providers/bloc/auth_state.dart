part of 'auth_bloc.dart';

/// https://youtu.be/_E3EF1jPumM?si=Xm_4EGd-5xRZHBVF&t=20781
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

/// loading state before the event begins
class SendingUserCredentials extends AuthState {
  const SendingUserCredentials();
}

/// loading state after the event done
class UserCredentialsSent extends AuthState {
  const UserCredentialsSent();
}

// ex)
// class UsersLoaded extends AuthState {
//   const UsersLoaded(this.users);
//
//   final List<User> users;
//
//   /// check the userId from the list of user
//   @override
//   List<Object> get props => users.map((element) = element.id).toList();
// }

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class AuthRegisteredToken extends AuthState {
  const AuthRegisteredToken(this.registeredAccessToken);

  final String registeredAccessToken;

  @override
  List<String> get props => [registeredAccessToken];
}
