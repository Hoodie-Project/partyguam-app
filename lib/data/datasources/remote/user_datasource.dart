import '../../index.dart';

abstract class UserCredentialDataSource {
  Future<AuthTokensDto> sendUserCredential({
    required String uid,
    required String idToken,
  });
}

/**
 * only returning one value.
 * if an error occurs inside of the datasource, throw the error.
 * data/repository will catch the error, then return a failure.
 * */
