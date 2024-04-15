import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:partyguam/app/route.dart';
import 'package:partyguam/app/theme/theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '${dotenv.env['APP_KEY']}',
    javaScriptAppKey: '${dotenv.env['APP_KEY']}',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
