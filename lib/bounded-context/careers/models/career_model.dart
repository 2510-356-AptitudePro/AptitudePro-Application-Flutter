import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/career.dart';

part 'career_model.freezed.dart';
part 'career_model.g.dart';

@freezed
class CareerModel with _$CareerModel {
  const factory CareerModel({
    required String id,
    required String name,
    required String description,
    required String fieldOfStudy,
    List<String>? requiredSkills,
    JobProspectsModel? jobProspects,
    required int duration,
    String? degreeType,
    String? curriculum,
    List<String>? prerequisites,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<UniversityModel> universities,
  }) = _CareerModel;

  const CareerModel._();

  factory CareerModel.fromJson(Map<String, dynamic> json) =>
      _$CareerModelFromJson(json);

  Career toEntity() => Career(
    id: id,
    name: name,
    description: description,
    fieldOfStudy: fieldOfStudy,
    requiredSkills: requiredSkills ?? [],
    jobProspects: jobProspects?.toEntity(),
    duration: duration,
    degreeType: degreeType,
    curriculum: curriculum,
    prerequisites: prerequisites ?? [],
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
    universities: universities.map((u) => u.toEntity()).toList(),
  );
}

@freezed
class JobProspectsModel with _$JobProspectsModel {
  const factory JobProspectsModel({
    required double averageSalary,
    required double employmentRate,
    required String growthProjection,
    required List<String> commonJobs,
  }) = _JobProspectsModel;

  const JobProspectsModel._();

  factory JobProspectsModel.fromJson(Map<String, dynamic> json) =>
      _$JobProspectsModelFromJson(json);

  JobProspects toEntity() => JobProspects(
    averageSalary: averageSalary,
    employmentRate: employmentRate,
    growthProjection: growthProjection,
    commonJobs: commonJobs,
  );
}

@freezed
class UniversityModel with _$UniversityModel {
  const factory UniversityModel({
    required String id,
    required String name,
    String? description,
    required String type,
    String? address,
    String? city,
    String? region,
    String? website,
    String? phone,
    String? email,
    List<String>? accreditations,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UniversityModel;

  const UniversityModel._();

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      _$UniversityModelFromJson(json);

  University toEntity() => University(
    id: id,
    name: name,
    description: description,
    type: type,
    address: address,
    city: city,
    region: region,
    website: website,
    phone: phone,
    email: email,
    accreditations: accreditations ?? [],
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}