import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

import 'core/index.dart';
import 'presentation/routes/route.dart';
import 'presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  KakaoSdk.init(
    nativeAppKey: dotenv.env['NATIVE_APP_KEY'],
  );

  configureDependencies();

  debugPrint('hosturl: ${dotenv.env['HOST_URL']}');

  // Flutter SDK 초기화

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}
