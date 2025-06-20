import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/constants/api_constants.dart';
import '../../../data/models/paginated/paginated_response_model.dart';
import '../models/test_model.dart';
import '../../results/models/test_result_model.dart';
import '../../../data/services/dio/dio_client.dart';

part 'test_service.g.dart';

final testServiceProvider = Provider<TestService>((ref) {
  final dio = ref.watch(dioProvider);
  return TestService(dio);
});

@RestApi()
abstract class TestService {
  factory TestService(Dio dio, {String baseUrl}) = _TestService;

  @GET(ApiConstants.tests)
  Future<PaginatedResponse<TestModel>> getTests({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('${ApiConstants.tests}/{id}')
  Future<TestModel> getTestById(@Path('id') String id);

  @GET('${ApiConstants.tests}/{id}/take')
  Future<TestModel> getTestForTaking(@Path('id') String id);

  @GET('${ApiConstants.tests}/type/{type}')
  Future<PaginatedResponse<TestModel>> getTestsByType(
      @Path('type') String type, {
        @Query('page') int? page,
        @Query('limit') int? limit,
      });

  @POST(ApiConstants.submitTest)
  Future<TestResultModel> submitTest(@Body() SubmitTestRequestModel request);

  @GET(ApiConstants.myResults)
  Future<PaginatedResponse<TestResultModel>> getMyResults({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('${ApiConstants.testResults}/{id}')
  Future<TestResultModel> getResultById(@Path('id') String id);
}