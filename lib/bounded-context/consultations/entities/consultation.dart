import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation.freezed.dart';
part 'consultation.g.dart';

@JsonEnum()
enum ConsultationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('no_show')
  noShow;

  String get displayName {
    switch (this) {
      case ConsultationStatus.pending:
        return 'Pendiente';
      case ConsultationStatus.accepted:
        return 'Aceptada';
      case ConsultationStatus.rejected:
        return 'Rechazada';
      case ConsultationStatus.scheduled:
        return 'Programada';
      case ConsultationStatus.completed:
        return 'Completada';
      case ConsultationStatus.cancelled:
        return 'Cancelada';
      case ConsultationStatus.inProgress:
        return 'En Progreso';
      case ConsultationStatus.confirmed:
        return 'Confirmada';
      case ConsultationStatus.noShow:
        return 'No Asistió';
    }
  }
}

@freezed
class Consultation with _$Consultation {
  const factory Consultation({
    required String id,
    @JsonKey(name: 'studentId') String? userId,
    required String psychologistId,
    @JsonKey(name: 'scheduledDate') required DateTime scheduledAt,
    required ConsultationStatus status,
    required DateTime createdAt,
    DateTime? updatedAt,
    @JsonKey(name: 'studentNotes') String? notes,
    @JsonKey(name: 'psychologistNotes') String? summary,
    String? recommendations,
    @Default(60) int duration,
    double? rating,
    String? feedback,
    String? meetingUrl,
    String? cancellationReason,
    String? psychologistName,
    String? psychologistSpecialization,
    String? userName,
    String? userEmail,
    String? psychologistEmail,
  }) = _Consultation;

  const Consultation._();

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);

  // Getters útiles
  bool get canBeCancelled {
    final now = DateTime.now();
    final timeDifference = scheduledAt.difference(now);

    return (status == ConsultationStatus.pending ||
        status == ConsultationStatus.accepted ||
        status == ConsultationStatus.scheduled) &&
        timeDifference.inHours >= 24;
  }

  bool get isUpcoming {
    return scheduledAt.isAfter(DateTime.now()) &&
        status != ConsultationStatus.cancelled &&
        status != ConsultationStatus.rejected;
  }

  bool get isActive {
    return status == ConsultationStatus.pending ||
        status == ConsultationStatus.accepted ||
        status == ConsultationStatus.scheduled ||
        status == ConsultationStatus.confirmed ||
        status == ConsultationStatus.inProgress;
  }

  String get formattedDuration {
    if (duration <= 60) {
      return '${duration}min';
    } else {
      final hours = duration ~/ 60;
      final minutes = duration % 60;
      return minutes > 0 ? '${hours}h ${minutes}min' : '${hours}h';
    }
  }

  String get timeSlot {
    final hour = scheduledAt.hour.toString().padLeft(2, '0');
    final minute = scheduledAt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}