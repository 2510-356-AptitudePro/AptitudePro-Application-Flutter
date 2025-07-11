import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/constants/api_constants.dart';
import '../models/career_model.dart';
import '../../../data/models/paginated/paginated_response_model.dart';
import '../../../data/services/dio/dio_client.dart';

part 'career_service.g.dart';

final careerServiceProvider = Provider<CareerService>((ref) {
  final dio = ref.watch(dioProvider);
  return CareerService(dio);
});

@RestApi()
abstract class CareerService {
  factory CareerService(Dio dio, {String baseUrl}) = _CareerService;

  @GET(ApiConstants.careers)
  Future<PaginatedResponse<CareerModel>> getCareers({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('${ApiConstants.careers}/{id}')
  Future<CareerModel> getCareerById(@Path('id') String id);

  @GET('${ApiConstants.careers}/search')
  Future<PaginatedResponse<CareerModel>> searchCareers(
      @Query('q') String query, {
        @Query('page') int? page,
        @Query('limit') int? limit,
      });

  @GET('${ApiConstants.careers}/field/{field}')
  Future<PaginatedResponse<CareerModel>> getCareersByField(
      @Path('field') String field, {
        @Query('page') int? page,
        @Query('limit') int? limit,
      });

  @GET('${ApiConstants.careers}/recommendations')
  Future<PaginatedResponse<CareerModel>> getRecommendations(
      @Query('skills') String skills,
      );

  @GET('${ApiConstants.careers}/{id}/universities')
  Future<PaginatedResponse<UniversityModel>> getUniversitiesByCareer(@Path('id') String id);

  @GET('${ApiConstants.universities}/all')
  Future<PaginatedResponse<UniversityModel>> getAllUniversities({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}