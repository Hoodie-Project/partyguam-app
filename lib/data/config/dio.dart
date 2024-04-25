import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final options = BaseOptions(
  baseUrl: dotenv.env['HOST_URL'] as String,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);

final dio = Dio(options);
