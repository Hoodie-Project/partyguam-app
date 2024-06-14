import 'package:go_router/go_router.dart';

import '../pages/main/main_1100.dart';
import '../pages/party/party_1150.dart';
import '../pages/sign_up/sign_in_0000.dart';
import '../pages/sign_up/sign_up_0111.dart';
import '../pages/sign_up/sign_up_0112.dart';
import '../pages/sign_up/sign_up_0113.dart';
import '../pages/sign_up/sign_up_0114.dart';
import '../pages/sign_up/sign_up_0115.dart';
import '../pages/sign_up_details/views/0122/sign_up_detail_0122.dart';
import '../pages/sign_up_details/views/sign_up_detail_0121.dart';
import '../pages/sign_up_details/views/sign_up_detail_0123.dart';
import '../pages/sign_up_details/views/sign_up_detail_0124.dart';
import '../pages/sign_up_details/views/sign_up_detail_0125.dart';
import '../pages/sign_up_details/views/sign_up_detail_0126.dart';
import '../pages/sign_up_details/views/sign_up_detail_0127.dart';
import 'route_path.dart';

final router = GoRouter(
  initialLocation: RouterPath.main,
  routes: [
    GoRoute(
      name: 'main1100',
      path: RouterPath.main,
      builder: (context, state) => const Main1100(),
    ),
    GoRoute(
      name: 'signIn0000',
      path: RouterPath.signUp,
      builder: (context, state) => const SignIn0000(),
      routes: [
        GoRoute(
            path: '0111',
            builder: (context, state) {
              final data = state.extra as Map<String, String?>;
              final email = data['email'] ?? '';

              return SignUp0111(email: email);
            }),
        GoRoute(
          path: '0112',
          builder: (context, state) => const SignUp0112(),
        ),
        GoRoute(
          path: '0113',
          builder: (context, state) => const SignUp0113(),
        ),
        GoRoute(
          path: '0114',
          builder: (context, state) => const SignUp0114(),
        ),
        GoRoute(
          path: '0115',
          builder: (context, state) => const SignUp0115(),
        ),
        GoRoute(
          path: 'detail/0121',
          builder: (context, state) => const SignUpDetail0121(),
        ),
        GoRoute(
          path: 'detail/0122',
          builder: (context, state) => const SignUpDetail0122(),
        ),
        GoRoute(
          name: 'signUpDetail0123',
          path: 'detail/0123',
          builder: (context, state) => const SignUpDetail0123(),
        ),
        GoRoute(
          name: 'signUpDetail0124',
          path: 'detail/0124',
          builder: (context, state) => const SignUpDetail0124(),
        ),
        GoRoute(
          name: 'signUpDetail0125',
          path: 'detail/0125',
          builder: (context, state) => const SignUpDetail0125(),
        ),
        GoRoute(
          name: 'signUpDetail0126',
          path: 'detail/0126',
          builder: (context, state) => const SignUpDetail0126(),
        ),
        GoRoute(
          name: 'signUpDetail0127',
          path: 'detail/0127',
          builder: (context, state) => const SignUpDetail0127(),
        ),
      ],
    ),
    GoRoute(
      name: 'party1150',
      path: '/party/1150',
      builder: (context, state) => const Party1150(),
    ),
  ],
);
