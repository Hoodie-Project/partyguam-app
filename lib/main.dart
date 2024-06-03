import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/index.dart';
import 'presentation/routes/route.dart';
import 'presentation/theme/theme.dart';

late SharedPreferences localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dotenv
  await dotenv.load(fileName: ".env");
  debugPrint('hosturl: ${dotenv.env['HOST_URL']}');

  // shared preferences
  localStorage = await SharedPreferences.getInstance();

  // GetIt
  initializeGetIt();

  // KakaoSDK
  KakaoSdk.init(
    nativeAppKey: dotenv.env['NATIVE_APP_KEY'],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
