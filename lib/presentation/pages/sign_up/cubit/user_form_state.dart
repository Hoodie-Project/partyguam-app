part of 'user_form_cubit.dart';

class UserFormState extends Equatable {
  const UserFormState({
    this.email = '',
    this.nickname = '',
    this.gender = '',
    this.birth = '',
    this.createUserComplete = false,
    this.error = '',
  });

  final String email;
  final String nickname;
  final String gender;
  final String birth;
  final bool createUserComplete;
  final String error;

  UserFormState copyWith({
    String? email,
    String? nickname,
    String? gender,
    String? birth,
    bool? createUserComplete,
    String? error,
  }) {
    return UserFormState(
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      createUserComplete: createUserComplete ?? this.createUserComplete,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [nickname, email, birth, gender, createUserComplete, error];
}
