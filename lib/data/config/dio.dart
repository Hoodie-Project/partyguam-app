import 'package:dio/dio.dart';
import 'package:partyguam/data/config/path.dart';

final dio = Dio(options);

final options = BaseOptions(
  baseUrl: ApiConfigPath.hostUri,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);
