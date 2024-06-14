part of 'user_form_cubit.dart';

class UserFormState extends Equatable {
  final String email;
  final String nickname;
  final String gender;
  final String birth;

  const UserFormState({
    this.email = '',
    this.nickname = '',
    this.gender = '',
    this.birth = '',
  });

  UserFormState copyWith({
    String? email,
    String? nickname,
    String? gender,
    String? birthday,
  }) {
    return UserFormState(
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birth: birthday ?? this.birth,
    );
  }

  @override
  List<Object?> get props => [nickname, email, birth, gender];
}
