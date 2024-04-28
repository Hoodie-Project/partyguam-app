import 'package:go_router/go_router.dart';
import 'package:partyguam/app/pages/sign_up_details/views/sign_up_details_0123.dart';
import 'package:partyguam/app/pages/sign_up_details/views/sign_up_details_0124.dart';

import '../pages/sign_up/views/login_0000.dart';
import '../pages/sign_up/views/sign_up_0111.dart';
import '../pages/sign_up/views/sign_up_0112.dart';
import '../pages/sign_up/views/sign_up_0113.dart';
import '../pages/sign_up/views/sign_up_0114.dart';
import '../pages/sign_up/views/sign_up_0115.dart';
import '../pages/sign_up_details/views/sign_up_details_0121.dart';

final navigator = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login0000(),
    ),
    GoRoute(
      path: '/sign_up/0111',
      builder: (context, state) => const SignUp0111(),
    ),
    GoRoute(
      path: '/sign_up/0112',
      builder: (context, state) => const SignUp0112(),
    ),
    GoRoute(
      path: '/sign_up/0113',
      builder: (context, state) => const SignUp0113(),
    ),
    GoRoute(
      path: '/sign_up/0113',
      builder: (context, state) => const SignUp0113(),
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
      path: '/sign_up/detail/0121',
      builder: (context, state) => const SignUpDetail0121(),
    ),
    GoRoute(
      name: 'signUpDetail0123',
      path: '/sign_up/detail/0123',
      builder: (context, state) => const SignUpDetail0123(),
    ),
    GoRoute(
      name: 'signUpDetail0124',
      path: '/sign_up/detail/0124',
      builder: (context, state) => const SignUpDetail0124(),
    ),
  ],
);
