import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void initGetIt() => getIt.init();

//dart run build_runner build --delete-conflicting-outputs
