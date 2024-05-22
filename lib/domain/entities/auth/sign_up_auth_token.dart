import 'package:equatable/equatable.dart';

class SignUpAuthToken extends Equatable {
  const SignUpAuthToken({
    required this.signUpAccessToken,
  });

  final String signUpAccessToken;

  @override
  List<Object?> get props => [signUpAccessToken];
}
