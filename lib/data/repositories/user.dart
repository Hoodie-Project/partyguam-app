import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import '../config/dio.dart';
import '../config/path.dart';
import '../dto/auth.dart';

abstract class UserRepository {
  Future<Auth> sendUserInfo(encrypt.Encrypted encryptedData);
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Auth> sendUserInfo(encrypt.Encrypted encryptedData) async {
    try {
      final response = await DioClient.instance.post(
        ApiAuthPath.encryptedUserId,
        data: encryptedData,
      );

      print(response.values.toString());
      return Auth.fromJson(response);
    } on DioException catch (error) {
      throw {error.message};
    }
  }
}

// checkNickname() async {
//   try {
//     final response = await dio.get(
//       ApiUserPath.nickName,
//
//     )
//   }
// }
