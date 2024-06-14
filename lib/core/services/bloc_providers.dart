import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/index.dart';
import '../index.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
        BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>()),
        BlocProvider<UserFormCubit>(
            create: (context) => getIt<UserFormCubit>()),
      ];
}
