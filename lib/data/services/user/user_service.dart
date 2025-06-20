import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/user/user_model.dart';
import '../dio/dio_client.dart';

part 'user_service.g.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final dio = ref.watch(dioProvider);
  return UserService(dio);
});

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET(ApiConstants.profile)
  Future<UserModel> getProfile();

  @PATCH(ApiConstants.profile)
  Future<UserModel> updateProfile(@Body() UpdateProfileRequestModel request);

  @PATCH(ApiConstants.changePassword)
  Future<void> changePassword(@Body() ChangePasswordRequestModel request);

  @GET(ApiConstants.psychologists)
  Future<List<UserModel>> getPsychologists({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiConstants.teachers)
  Future<List<UserModel>> getTeachers({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('${ApiConstants.users}/{id}')
  Future<UserModel> getUserById(@Path('id') String id);
}