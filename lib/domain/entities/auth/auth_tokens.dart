import 'package:equatable/equatable.dart';

class AuthTokens extends Equatable {
  const AuthTokens({
    required this.refreshToken,
  });

  final String refreshToken;

  @override
  List<Object?> get props => [refreshToken];
}
