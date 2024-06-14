import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partyguam/presentation/pages/sign_up/cubit/user_form_cubit.dart';

import '../../presentation/pages/sign_up/cubit/auth_cubit.dart';
import '../../presentation/pages/sign_up/cubit/user_cubit.dart';
import '../index.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
        BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>()),
        BlocProvider<UserFormCubit>(
            create: (context) => getIt<UserFormCubit>()),
      ];
}
