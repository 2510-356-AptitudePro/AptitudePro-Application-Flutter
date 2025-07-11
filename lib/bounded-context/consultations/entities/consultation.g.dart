// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationImpl _$$ConsultationImplFromJson(Map<String, dynamic> json) =>
    _$ConsultationImpl(
      id: json['id'] as String,
      userId: json['studentId'] as String?,
      psychologistId: json['psychologistId'] as String,
      scheduledAt: DateTime.parse(json['scheduledDate'] as String),
      status: $enumDecode(_$ConsultationStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      notes: json['studentNotes'] as String?,
      summary: json['psychologistNotes'] as String?,
      recommendations: json['recommendations'] as String?,
      duration: (json['duration'] as num?)?.toInt() ?? 60,
      rating: (json['rating'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
      meetingUrl: json['meetingUrl'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      psychologistName: json['psychologistName'] as String?,
      psychologistSpecialization: json['psychologistSpecialization'] as String?,
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      psychologistEmail: json['psychologistEmail'] as String?,
    );

Map<String, dynamic> _$$ConsultationImplToJson(_$ConsultationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.userId,
      'psychologistId': instance.psychologistId,
      'scheduledDate': instance.scheduledAt.toIso8601String(),
      'status': _$ConsultationStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'studentNotes': instance.notes,
      'psychologistNotes': instance.summary,
      'recommendations': instance.recommendations,
      'duration': instance.duration,
      'rating': instance.rating,
      'feedback': instance.feedback,
      'meetingUrl': instance.meetingUrl,
      'cancellationReason': instance.cancellationReason,
      'psychologistName': instance.psychologistName,
      'psychologistSpecialization': instance.psychologistSpecialization,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'psychologistEmail': instance.psychologistEmail,
    };

const _$ConsultationStatusEnumMap = {
  ConsultationStatus.pending: 'pending',
  ConsultationStatus.accepted: 'accepted',
  ConsultationStatus.rejected: 'rejected',
  ConsultationStatus.completed: 'completed',
  ConsultationStatus.cancelled: 'cancelled',
  ConsultationStatus.scheduled: 'scheduled',
  ConsultationStatus.inProgress: 'in_progress',
  ConsultationStatus.confirmed: 'confirmed',
  ConsultationStatus.noShow: 'no_show',
};
