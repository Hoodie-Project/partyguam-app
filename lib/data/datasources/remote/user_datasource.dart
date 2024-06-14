import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/index.dart';
import '../../index.dart';

//
abstract class UserDataSource {
  Future<void> sendUserCredential({
    required String uid,
    required String idToken,
  });

  Future<ResponseDto> checkUserNickname({
    required String nickname,
  });

  Future<AccessTokenDto> createUser({
    required String nickname,
    required String email,
    required String gender,
    required String birth,
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
        ApiUserPath.userCredentials,
        data: data,
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
  Future<ResponseDto> checkUserNickname({required String nickname}) async {
    try {
      // check cookie

      // await _dioClient.deleteCookie((Uri.parse(ApiConfigPath.hostUri)));

      // debugPrint(_dioClient().)

      final params = {'nickname': nickname};

      final response = await _dioClient.get(
        ApiUserPath.nickname,
        queryParameters: params,
      );

      return ResponseDto.fromJson(response);
    } on ApiException {
      rethrow;
    } catch (e) {
      /// dart error
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<AccessTokenDto> createUser({
    required String email,
    required String nickname,
    required String birth,
    required String gender,
  }) async {
    try {
      // check cookie

      final data = {
        'email': email,
        'nickname': nickname,
        'birth': birth,
        'gender': gender,
      };

      final response = await _dioClient.post(
        ApiUserPath.users,
        data: data,
      );

      debugPrint('here: ${AccessTokenDto.fromJson(response)}');

      return AccessTokenDto.fromJson(response);
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
