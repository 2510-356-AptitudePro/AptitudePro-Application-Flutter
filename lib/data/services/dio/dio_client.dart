import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../core/constants/api_constants.dart';
import '../../../bounded-context/auth/services/auth_interceptor.dart';
import '../token/token_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Interceptors
  dio.interceptors.addAll([
    AuthInterceptor(dio, tokenService),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: false,
    ),
  ]);

  return dio;
});