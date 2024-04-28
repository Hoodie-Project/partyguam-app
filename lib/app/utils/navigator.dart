import 'package:go_router/go_router.dart';

import '../pages/sign_up/views/login_0000.dart';
import '../pages/sign_up/views/sign_up_0111.dart';
import '../pages/sign_up/views/sign_up_0112.dart';
import '../pages/sign_up/views/sign_up_0113.dart';
import '../pages/sign_up/views/sign_up_0114.dart';
import '../pages/sign_up/views/sign_up_0115.dart';
import '../pages/sign_up_details/sign_up_0121.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login0000(),
    ),
    GoRoute(
      path: '/sign_up/0111',
      builder: (context, state) => SignUp0111(),
    ),
    GoRoute(
      path: '/sign_up/0112',
      builder: (context, state) => SignUp0112(),
    ),
    GoRoute(
      path: '/sign_up/0113',
      builder: (context, state) => SignUp0113(),
    ),
    GoRoute(
      path: '/sign_up/0113',
      builder: (context, state) => SignUp0113(),
    ),
    GoRoute(
      path: '/sign_up/0114',
      builder: (context, state) => const SignUp0114(),
    ),
    GoRoute(
      path: '/sign_up/0115',
      builder: (context, state) => const SignUp0115(),
    ),
    GoRoute(
      path: '/sign_up/0121',
      builder: (context, state) => const SignUp0121(),
    ),
  ],
);
