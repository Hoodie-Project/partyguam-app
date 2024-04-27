// import 'package:flutter/material.dart';
// import 'package:partyguam/app/pages/sign_up/login_0000.dart';
// import 'package:partyguam/app/pages/sign_up/sign_up_0111.dart';
// import 'package:partyguam/app/pages/sign_up/sign_up_0114.dart';
// import 'package:partyguam/app/pages/sign_up/sign_up_0115.dart';
// import 'package:partyguam/app/pages/sign_up/widgets/app_bar.dart';
//
// import 'app/pages/sign_up/sign_up_0111.dart';
// import 'app/pages/sign_up/sign_up_0112.dart';
// import 'app/pages/sign_up/sign_up_0113.dart';
// import 'app/pages/sign_up/widgets/buttons.dart';
// import 'app/theme/theme.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: lightTheme,
//       home: const Login0000(),
//       initialRoute: '/',
//       routes: {
//         '/sign_up/0111': (context) => const SignUp0111(),
//         '/sign_up/0112': (context) => const SignUp0112(),
//         '/sign_up/0113': (context) => const SignUp0113(),
//         '/sign_up/0114': (context) => const SignUp0114(),
//         '/sign_up/0115': (context) => const SignUp0115(),
//       },
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final formKey = GlobalKey<FormState>();
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const LoginAppBar(
//         title: '메인',
//       ),
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 2,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login/0000');
//               },
//               style: filledLongStyle,
//               child: const Text('다음'),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login/0000');
//               },
//               style: filledShortStyle,
//               child: const Text('작성하기'),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login/0000');
//               },
//               style: outlinedShortStyle,
//               child: const Text('홈으로'),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             // Form(
//             //     key: formKey,
//             //     child: Column(
//             //       children: [
//             //         PrimaryInputBox(
//             //           hintText: '20자 이상',
//             //         )
//             //       ],
//             //     )),
//             SquareButton(content: '여자'),
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
