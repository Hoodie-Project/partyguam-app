import 'package:equatable/equatable.dart';

class SignUpAuthToken extends Equatable {
  const SignUpAuthToken({
    required this.signUpToken,
  });

  final String signUpToken;

  @override
  List<Object?> get props => [signUpToken];
}
