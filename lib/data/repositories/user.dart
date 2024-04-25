import 'package:dio/dio.dart';
import 'package:partyguam/data/config/path.dart';

import '../config/dio.dart';

Future sendUserInfo(encrypted) async {
  try {
    final response = await dio.post(
      ApiAuthPath.encryptedUserId,
      data: encrypted,
    );

    return response.data.toString();
  } on DioException catch (error) {
    print(error);
  }
}
