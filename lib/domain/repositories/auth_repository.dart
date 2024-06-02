import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../core/index.dart';

abstract class AuthRepository {
  ApiResult<OAuthToken?> signInWithKakao();

  ApiResult<User?> getKakaoUserInfo();
}

// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addObserver(this);
// }
//
// @override
// void dispose() {
//   WidgetsBinding.instance.removeObserver(this);
//   super.dispose();
// }
//
// @override
// void didChangeAppLifecycleState(AppLifecycleState state) {
//   if (state == AppLifecycleState.resumed) {
//     // 앱이 포그라운드로 돌아왔을 때 상태를 확인
//     context.read<AuthCubit>().checkSignInStatus();
//   }
// }
