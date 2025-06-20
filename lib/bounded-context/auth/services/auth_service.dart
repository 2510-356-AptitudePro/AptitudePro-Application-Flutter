import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/api_constants.dart';
import '../../../data/models/user/user_model.dart';
import '../../../data/services/dio/dio_client.dart';


part 'auth_service.g.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(ApiConstants.signIn)
  Future<AuthResponseModel> signIn(@Body() SignInRequestModel request);

  @POST(ApiConstants.signUp)
  Future<AuthResponseModel> signUp(@Body() SignUpRequestModel request);

  @POST(ApiConstants.refreshToken)
  Future<AuthResponseModel> refreshToken(@Body() Map<String, dynamic> request);
}