import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/sign_up/cubit/auth_cubit.dart';
import '../index.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
      ];
}