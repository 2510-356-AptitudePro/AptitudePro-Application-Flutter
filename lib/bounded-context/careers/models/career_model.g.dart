// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CareerModelImpl _$$CareerModelImplFromJson(Map<String, dynamic> json) =>
    _$CareerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      fieldOfStudy: json['fieldOfStudy'] as String,
      requiredSkills: (json['requiredSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      jobProspects: json['jobProspects'] == null
          ? null
          : JobProspectsModel.fromJson(
              json['jobProspects'] as Map<String, dynamic>),
      duration: (json['duration'] as num).toInt(),
      degreeType: json['degreeType'] as String?,
      curriculum: json['curriculum'] as String?,
      prerequisites: (json['prerequisites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      universities: (json['universities'] as List<dynamic>?)
              ?.map((e) => UniversityModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CareerModelImplToJson(_$CareerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'fieldOfStudy': instance.fieldOfStudy,
      'requiredSkills': instance.requiredSkills,
      'jobProspects': instance.jobProspects,
      'duration': instance.duration,
      'degreeType': instance.degreeType,
      'curriculum': instance.curriculum,
      'prerequisites': instance.prerequisites,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'universities': instance.universities,
    };

_$JobProspectsModelImpl _$$JobProspectsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JobProspectsModelImpl(
      averageSalary: (json['averageSalary'] as num).toDouble(),
      employmentRate: (json['employmentRate'] as num).toDouble(),
      growthProjection: json['growthProjection'] as String,
      commonJobs: (json['commonJobs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$JobProspectsModelImplToJson(
        _$JobProspectsModelImpl instance) =>
    <String, dynamic>{
      'averageSalary': instance.averageSalary,
      'employmentRate': instance.employmentRate,
      'growthProjection': instance.growthProjection,
      'commonJobs': instance.commonJobs,
    };

_$UniversityModelImpl _$$UniversityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UniversityModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      website: json['website'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      accreditations: (json['accreditations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UniversityModelImplToJson(
        _$UniversityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'address': instance.address,
      'city': instance.city,
      'region': instance.region,
      'website': instance.website,
      'phone': instance.phone,
      'email': instance.email,
      'accreditations': instance.accreditations,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
