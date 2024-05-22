import 'package:equatable/equatable.dart';

class UserInformation extends Equatable {
  const UserInformation({
    required this.id,
    required this.email,
    required this.nickname,
    required this.birth,
    required this.gender,
    required this.image,
  });

  final String id;
  final String email;
  final String nickname;
  final String birth;
  final String gender;
  final String image;

  @override
  List<Object?> get props => [id, email];
}
