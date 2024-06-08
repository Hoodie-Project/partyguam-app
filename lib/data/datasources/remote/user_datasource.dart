import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/index.dart';
import '../../index.dart';

//
abstract class UserDataSource {
  Future<void> sendUserCredential({
    required String uid,
    required String idToken,
  });

  Future<void> checkUserNickname({
    required String nickname,
  });
}

/// https://youtu.be/_E3EF1jPumM?si=C237xCkb43LXiI4I&t=16311
@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<void> sendUserCredential({
    required String uid,
    required String idToken,
  }) async {
    // 1. returns the proper data when the response status code
    // is 200 or 201
    // 2. if the status code is 400 or 500, it returns "A CUSTOM EXCEPTION"
    // with the right message

    try {
      final data = {
        'uid': uid,
        'idToken': idToken,
      };

      await _dioClient.post(
        ApiAuthPath.userCredentials,
        data: data,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',
          },
        ),
      );

      /// https://youtu.be/_E3EF1jPumM?si=Bq7ovtYzj46WizbJ&t=18712
      /// when you throw an error inside of try phrase, make sure rethrow the error between try - catch phrase.
      /// because it will throw errors in catch phase, then we cannot indicate where this error occurs.
    } on ApiException {
      rethrow;
    } catch (e) {
      /// dart error
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> checkUserNickname({required String nickname}) async {
    try {
      // check cookie

      final data = {'nickname': nickname};

      await _dioClient.post(
        ApiUserPath.nickName,
        data: data,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',
          },
        ),
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      /// dart error
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}

/**
 * only returning one value.
 * if an error occurs inside of the datasource, throw the error.
 * data/repository will catch the error, then return a failure.
 * */
