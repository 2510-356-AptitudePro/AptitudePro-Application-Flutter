import 'package:freezed_annotation/freezed_annotation.dart';

part 'psychologist.freezed.dart';
part 'psychologist.g.dart';

@freezed
class Psychologist with _$Psychologist {
  const factory Psychologist({
    required String id,
    // ✅ Campos que SÍ vienen en tu JSON
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    @JsonKey(name: 'profilePicture') String? profileImage,
    String? bio,
    DateTime? createdAt,

    // ✅ Campos opcionales con valores por defecto (NO vienen en tu JSON actual)
    @Default('Psicología General') String specialization,
    @Default('') String licenseNumber,
    @Default(0) int yearsOfExperience,
    @Default(0.0) double rating,
    @Default(0) int totalConsultations,
    @Default([]) List<String> languages,
    @Default([]) List<String> specialties,
    @Default([]) List<AvailabilitySlot> availability,
    @Default(true) bool isAvailable,
    @Default(0.0) double consultationPrice,
    @Default('USD') String currency,
  }) = _Psychologist;

  const Psychologist._();

  // ✅ CUSTOM fromJson para manejar tu estructura específica de JSON
  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(
      id: json['id'] as String? ?? '',
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      profileImage: json['profilePicture'] as String?, // Mapeo correcto
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,

      // Campos que pueden venir o no en el JSON
      specialization: json['specialization'] as String? ?? 'Psicología General',
      licenseNumber: json['licenseNumber'] as String? ?? '',
      yearsOfExperience: json['yearsOfExperience'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalConsultations: json['totalConsultations'] as int? ?? 0,
      languages: json['languages'] != null
          ? List<String>.from(json['languages'])
          : ['Español'],
      specialties: json['specialties'] != null
          ? List<String>.from(json['specialties'])
          : [],
      availability: json['availability'] != null
          ? (json['availability'] as List)
          .map((slot) => AvailabilitySlot.fromJson(slot))
          .toList()
          : [],
      isAvailable: json['isAvailable'] as bool? ?? true,
      consultationPrice: (json['consultationPrice'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
    );
  }

  // ✅ Getters útiles
  String get fullName {
    final first = firstName ?? '';
    final last = lastName ?? '';
    return '$first $last'.trim();
  }

  String get displayName {
    if (fullName.isNotEmpty) return fullName;
    if (username != null) return '@$username';
    return email ?? 'Usuario';
  }

  String get formattedRating {
    if (rating > 0) return '⭐ ${rating.toStringAsFixed(1)}';
    return '';
  }

  String get experienceText {
    if (yearsOfExperience > 0) {
      return '$yearsOfExperience año${yearsOfExperience != 1 ? 's' : ''} de experiencia';
    }
    return 'Nuevo profesional';
  }

  bool get hasProfileImage => profileImage != null && profileImage!.isNotEmpty;
}

@freezed
class AvailabilitySlot with _$AvailabilitySlot {
  const factory AvailabilitySlot({
    required String dayOfWeek, // 'monday', 'tuesday', etc.
    required String startTime, // '09:00'
    required String endTime,   // '17:00'
  }) = _AvailabilitySlot;

  const AvailabilitySlot._();

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AvailabilitySlotFromJson(json);

  // ✅ Getter para mostrar el día en español
  String get dayInSpanish {
    switch (dayOfWeek.toLowerCase()) {
      case 'monday':
        return 'Lunes';
      case 'tuesday':
        return 'Martes';
      case 'wednesday':
        return 'Miércoles';
      case 'thursday':
        return 'Jueves';
      case 'friday':
        return 'Viernes';
      case 'saturday':
        return 'Sábado';
      case 'sunday':
        return 'Domingo';
      default:
        return dayOfWeek;
    }
  }

  String get timeRange => '$startTime - $endTime';
}