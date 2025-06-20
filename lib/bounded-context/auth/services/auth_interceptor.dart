import 'package:dio/dio.dart';
import '../../../data/services/token/token_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenService tokenService;

  AuthInterceptor(this.dio, this.tokenService);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await tokenService.getAccessToken();

    if (token != null && !_isAuthEndpoint(options.path)) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isAuthEndpoint(err.requestOptions.path)) {
      // Token might be expired, try to refresh
      try {
        await _refreshToken();

        // Retry the original request
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        // Refresh failed, logout user
        await tokenService.clearTokens();
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  bool _isAuthEndpoint(String path) {
    return path.contains('/auth/signin') ||
        path.contains('/auth/signup') ||
        path.contains('/auth/refresh');
  }

  Future<void> _refreshToken() async {
    final refreshToken = await tokenService.getRefreshToken();
    if (refreshToken == null) throw Exception('No refresh token');

    final response = await dio.post(
      '/api/v1/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    final newAccessToken = response.data['access_token'];
    await tokenService.saveAccessToken(newAccessToken);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final token = await tokenService.getAccessToken();

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $token',
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}