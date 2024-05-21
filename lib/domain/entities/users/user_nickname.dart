import 'package:equatable/equatable.dart';

class UserNickname extends Equatable {
  const UserNickname({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object?> get props => [nickname];
}
