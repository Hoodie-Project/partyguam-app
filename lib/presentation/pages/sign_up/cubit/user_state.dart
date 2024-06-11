part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

class SendUserCredentialsSuccess extends UserState {
  const SendUserCredentialsSuccess();
}

class SendUserCredentialsFailure extends UserState {
  const SendUserCredentialsFailure();
}

final class NicknameAvailable extends UserState {
  const NicknameAvailable();
}

final class NicknameUnavailable extends UserState {
  const NicknameUnavailable();
}

final class CheckUserNicknamePending extends UserState {
  const CheckUserNicknamePending();
}

final class CheckUserNicknameComplete extends UserState {
  const CheckUserNicknameComplete();
}

final class Registered extends UserState {
  const Registered();
}

final class Unregistered extends UserState {
  const Unregistered();
}

final class CreateUserComplete extends UserState {
  const CreateUserComplete();
}

class UserError extends UserState {
  const UserError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
