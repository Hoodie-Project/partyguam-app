import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';
import '../index.dart';

@Injectable()
class SignInWithKakao extends UsecaseWithoutParams {
  SignInWithKakao(this._repository);

  final AuthRepository _repository;

  @override
  ApiResult<OAuthToken?> call() async => _repository.signInWithKakao();
}

@Injectable()
class GetKakaoUserInfo extends UsecaseWithoutParams {
  GetKakaoUserInfo(this._repository);

  final AuthRepository _repository;

  @override
  ApiResult<User?> call() async => _repository.getKakaoUserInfo();
}
