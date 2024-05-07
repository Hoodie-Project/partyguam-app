import 'package:flutter_dotenv/flutter_dotenv.dart';

/// https://api.flutter.dev/flutter/dart-core/String/String.fromEnvironment.html
abstract class ApiConfigPath {
  static final hostUri = String.fromEnvironment(
    'hostUri',
    defaultValue: dotenv.env['HOST_URL'] as String,
  );
}

abstract class ApiAuthPath {
  static const encryptedUserId = String.fromEnvironment(
    'encryptedUserId',
    defaultValue: '/users/app/kakao/login',
  );
}

abstract class ApiUserPath {
  static const nickName = String.fromEnvironment(
    'nickName',
    defaultValue: '/users/check-nickname',
  );
}
