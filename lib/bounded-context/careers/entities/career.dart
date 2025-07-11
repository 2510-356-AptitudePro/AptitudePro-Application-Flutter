import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Career extends Equatable {
  final String id;
  final String name;
  final String description;
  final String fieldOfStudy;
  final List<String> requiredSkills;
  final JobProspects? jobProspects;
  final int duration; // años
  final String? degreeType;
  final String? curriculum;
  final List<String> prerequisites;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<University> universities;

  const Career({
    required this.id,
    required this.name,
    required this.description,
    required this.fieldOfStudy,
    this.requiredSkills = const [],
    this.jobProspects,
    required this.duration,
    this.degreeType,
    this.curriculum,
    this.prerequisites = const [],
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.universities = const [],
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    fieldOfStudy,
    requiredSkills,
    jobProspects,
    duration,
    degreeType,
    curriculum,
    prerequisites,
    isActive,
    createdAt,
    updatedAt,
    universities,
  ];

  String? get title => '';
  String? get imageUrl => null;
  double? get averageSalary => jobProspects?.averageSalary;
  List<String>? get relatedJobs => jobProspects?.commonJobs;
  JobDemand? get jobDemand => JobDemand.veryHigh;

  // ✅ FIX: Mapear fieldOfStudy string a CareerField enum
  CareerField get field {
    switch (fieldOfStudy.toLowerCase()) {
      case 'tecnología':
      case 'technology':
      case 'informática':
      case 'sistemas':
        return CareerField.technology;
      case 'salud':
      case 'health':
      case 'medicina':
      case 'enfermería':
        return CareerField.health;
      case 'negocios':
      case 'business':
      case 'administración':
      case 'economía':
        return CareerField.business;
      case 'artes':
      case 'arts':
      case 'diseño':
      case 'música':
        return CareerField.arts;
      case 'ciencias':
      case 'science':
      case 'biología':
      case 'química':
        return CareerField.science;
      case 'educación':
      case 'education':
      case 'pedagogía':
        return CareerField.education;
      case 'ingeniería':
      case 'engineering':
        return CareerField.engineering;
      case 'ciencias sociales':
      case 'social_sciences':
      case 'psicología':
      case 'sociología':
        return CareerField.socialSciences;
      default:
        return CareerField.science; // Default fallback
    }
  }
}

class JobProspects extends Equatable {
  final double averageSalary;
  final double employmentRate;
  final String growthProjection;
  final List<String> commonJobs;

  const JobProspects({
    required this.averageSalary,
    required this.employmentRate,
    required this.growthProjection,
    required this.commonJobs,
  });

  @override
  List<Object?> get props => [
    averageSalary,
    employmentRate,
    growthProjection,
    commonJobs,
  ];
}

enum CareerField {
  @JsonValue('technology')
  technology,
  @JsonValue('health')
  health,
  @JsonValue('business')
  business,
  @JsonValue('arts')
  arts,
  @JsonValue('science')
  science,
  @JsonValue('education')
  education,
  @JsonValue('engineering')
  engineering,
  @JsonValue('social_sciences')
  socialSciences,
}

extension CareerFieldExtension on CareerField {
  String get displayName {
    switch (this) {
      case CareerField.technology:
        return 'Tecnología';
      case CareerField.health:
        return 'Salud';
      case CareerField.business:
        return 'Negocios';
      case CareerField.arts:
        return 'Artes';
      case CareerField.science:
        return 'Ciencias';
      case CareerField.education:
        return 'Educación';
      case CareerField.engineering:
        return 'Ingeniería';
      case CareerField.socialSciences:
        return 'Ciencias Sociales';
    }
  }
}

enum JobDemand {
  @JsonValue('very_high')
  veryHigh,
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
}

extension JobDemandExtension on JobDemand {
  String get displayName {
    switch (this) {
      case JobDemand.veryHigh:
        return 'Muy Alta';
      case JobDemand.high:
        return 'Alta';
      case JobDemand.medium:
        return 'Media';
      case JobDemand.low:
        return 'Baja';
    }
  }
}

class University extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String type;
  final String? address;
  final String? city;
  final String? region;
  final String? website;
  final String? phone;
  final String? email;
  final List<String> accreditations;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const University({
    required this.id,
    required this.name,
    this.description,
    required this.type,
    this.address,
    this.city,
    this.region,
    this.website,
    this.phone,
    this.email,
    this.accreditations = const [],
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    type,
    address,
    city,
    region,
    website,
    phone,
    email,
    accreditations,
    isActive,
    createdAt,
    updatedAt,
  ];

  String? get location => city != null ? '$city, $region' : region;
}