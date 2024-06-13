import 'package:equatable/equatable.dart';

class SendUserCredentialParams extends Equatable {
  const SendUserCredentialParams({
    required this.uid,
    required this.idToken,
  });

  final String uid;
  final String idToken;

  @override
  List<Object?> get props => [uid];
}

class CheckUserNicknameParams extends Equatable {
  const CheckUserNicknameParams({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object?> get props => [nickname];
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.email,
    required this.nickname,
    required this.birth,
    required this.gender,
  });

  final String email;
  final String nickname;
  final String birth;
  final String gender;

  @override
  List<Object?> get props => [email];
}
