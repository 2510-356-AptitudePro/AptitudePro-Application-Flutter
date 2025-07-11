// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Consultation _$ConsultationFromJson(Map<String, dynamic> json) {
  return _Consultation.fromJson(json);
}

/// @nodoc
mixin _$Consultation {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'studentId')
  String? get userId => throw _privateConstructorUsedError;
  String get psychologistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduledDate')
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  ConsultationStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'studentNotes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'psychologistNotes')
  String? get summary => throw _privateConstructorUsedError;
  String? get recommendations => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  String? get meetingUrl => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  String? get psychologistName => throw _privateConstructorUsedError;
  String? get psychologistSpecialization => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  String? get psychologistEmail => throw _privateConstructorUsedError;

  /// Serializes this Consultation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationCopyWith<Consultation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCopyWith<$Res> {
  factory $ConsultationCopyWith(
          Consultation value, $Res Function(Consultation) then) =
      _$ConsultationCopyWithImpl<$Res, Consultation>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'studentId') String? userId,
      String psychologistId,
      @JsonKey(name: 'scheduledDate') DateTime scheduledAt,
      ConsultationStatus status,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(name: 'studentNotes') String? notes,
      @JsonKey(name: 'psychologistNotes') String? summary,
      String? recommendations,
      int duration,
      double? rating,
      String? feedback,
      String? meetingUrl,
      String? cancellationReason,
      String? psychologistName,
      String? psychologistSpecialization,
      String? userName,
      String? userEmail,
      String? psychologistEmail});
}

/// @nodoc
class _$ConsultationCopyWithImpl<$Res, $Val extends Consultation>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? psychologistId = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? notes = freezed,
    Object? summary = freezed,
    Object? recommendations = freezed,
    Object? duration = null,
    Object? rating = freezed,
    Object? feedback = freezed,
    Object? meetingUrl = freezed,
    Object? cancellationReason = freezed,
    Object? psychologistName = freezed,
    Object? psychologistSpecialization = freezed,
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? psychologistEmail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistId: null == psychologistId
          ? _value.psychologistId
          : psychologistId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConsultationStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      meetingUrl: freezed == meetingUrl
          ? _value.meetingUrl
          : meetingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistName: freezed == psychologistName
          ? _value.psychologistName
          : psychologistName // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistSpecialization: freezed == psychologistSpecialization
          ? _value.psychologistSpecialization
          : psychologistSpecialization // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistEmail: freezed == psychologistEmail
          ? _value.psychologistEmail
          : psychologistEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultationImplCopyWith<$Res>
    implements $ConsultationCopyWith<$Res> {
  factory _$$ConsultationImplCopyWith(
          _$ConsultationImpl value, $Res Function(_$ConsultationImpl) then) =
      __$$ConsultationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'studentId') String? userId,
      String psychologistId,
      @JsonKey(name: 'scheduledDate') DateTime scheduledAt,
      ConsultationStatus status,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(name: 'studentNotes') String? notes,
      @JsonKey(name: 'psychologistNotes') String? summary,
      String? recommendations,
      int duration,
      double? rating,
      String? feedback,
      String? meetingUrl,
      String? cancellationReason,
      String? psychologistName,
      String? psychologistSpecialization,
      String? userName,
      String? userEmail,
      String? psychologistEmail});
}

/// @nodoc
class __$$ConsultationImplCopyWithImpl<$Res>
    extends _$ConsultationCopyWithImpl<$Res, _$ConsultationImpl>
    implements _$$ConsultationImplCopyWith<$Res> {
  __$$ConsultationImplCopyWithImpl(
      _$ConsultationImpl _value, $Res Function(_$ConsultationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? psychologistId = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? notes = freezed,
    Object? summary = freezed,
    Object? recommendations = freezed,
    Object? duration = null,
    Object? rating = freezed,
    Object? feedback = freezed,
    Object? meetingUrl = freezed,
    Object? cancellationReason = freezed,
    Object? psychologistName = freezed,
    Object? psychologistSpecialization = freezed,
    Object? userName = freezed,
    Object? userEmail = freezed,
    Object? psychologistEmail = freezed,
  }) {
    return _then(_$ConsultationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistId: null == psychologistId
          ? _value.psychologistId
          : psychologistId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConsultationStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      meetingUrl: freezed == meetingUrl
          ? _value.meetingUrl
          : meetingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistName: freezed == psychologistName
          ? _value.psychologistName
          : psychologistName // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistSpecialization: freezed == psychologistSpecialization
          ? _value.psychologistSpecialization
          : psychologistSpecialization // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      psychologistEmail: freezed == psychologistEmail
          ? _value.psychologistEmail
          : psychologistEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationImpl extends _Consultation {
  const _$ConsultationImpl(
      {required this.id,
      @JsonKey(name: 'studentId') this.userId,
      required this.psychologistId,
      @JsonKey(name: 'scheduledDate') required this.scheduledAt,
      required this.status,
      required this.createdAt,
      this.updatedAt,
      @JsonKey(name: 'studentNotes') this.notes,
      @JsonKey(name: 'psychologistNotes') this.summary,
      this.recommendations,
      this.duration = 60,
      this.rating,
      this.feedback,
      this.meetingUrl,
      this.cancellationReason,
      this.psychologistName,
      this.psychologistSpecialization,
      this.userName,
      this.userEmail,
      this.psychologistEmail})
      : super._();

  factory _$ConsultationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'studentId')
  final String? userId;
  @override
  final String psychologistId;
  @override
  @JsonKey(name: 'scheduledDate')
  final DateTime scheduledAt;
  @override
  final ConsultationStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'studentNotes')
  final String? notes;
  @override
  @JsonKey(name: 'psychologistNotes')
  final String? summary;
  @override
  final String? recommendations;
  @override
  @JsonKey()
  final int duration;
  @override
  final double? rating;
  @override
  final String? feedback;
  @override
  final String? meetingUrl;
  @override
  final String? cancellationReason;
  @override
  final String? psychologistName;
  @override
  final String? psychologistSpecialization;
  @override
  final String? userName;
  @override
  final String? userEmail;
  @override
  final String? psychologistEmail;

  @override
  String toString() {
    return 'Consultation(id: $id, userId: $userId, psychologistId: $psychologistId, scheduledAt: $scheduledAt, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, summary: $summary, recommendations: $recommendations, duration: $duration, rating: $rating, feedback: $feedback, meetingUrl: $meetingUrl, cancellationReason: $cancellationReason, psychologistName: $psychologistName, psychologistSpecialization: $psychologistSpecialization, userName: $userName, userEmail: $userEmail, psychologistEmail: $psychologistEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.psychologistId, psychologistId) ||
                other.psychologistId == psychologistId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.meetingUrl, meetingUrl) ||
                other.meetingUrl == meetingUrl) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.psychologistName, psychologistName) ||
                other.psychologistName == psychologistName) &&
            (identical(other.psychologistSpecialization,
                    psychologistSpecialization) ||
                other.psychologistSpecialization ==
                    psychologistSpecialization) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.psychologistEmail, psychologistEmail) ||
                other.psychologistEmail == psychologistEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        psychologistId,
        scheduledAt,
        status,
        createdAt,
        updatedAt,
        notes,
        summary,
        recommendations,
        duration,
        rating,
        feedback,
        meetingUrl,
        cancellationReason,
        psychologistName,
        psychologistSpecialization,
        userName,
        userEmail,
        psychologistEmail
      ]);

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      __$$ConsultationImplCopyWithImpl<_$ConsultationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationImplToJson(
      this,
    );
  }
}

abstract class _Consultation extends Consultation {
  const factory _Consultation(
      {required final String id,
      @JsonKey(name: 'studentId') final String? userId,
      required final String psychologistId,
      @JsonKey(name: 'scheduledDate') required final DateTime scheduledAt,
      required final ConsultationStatus status,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      @JsonKey(name: 'studentNotes') final String? notes,
      @JsonKey(name: 'psychologistNotes') final String? summary,
      final String? recommendations,
      final int duration,
      final double? rating,
      final String? feedback,
      final String? meetingUrl,
      final String? cancellationReason,
      final String? psychologistName,
      final String? psychologistSpecialization,
      final String? userName,
      final String? userEmail,
      final String? psychologistEmail}) = _$ConsultationImpl;
  const _Consultation._() : super._();

  factory _Consultation.fromJson(Map<String, dynamic> json) =
      _$ConsultationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'studentId')
  String? get userId;
  @override
  String get psychologistId;
  @override
  @JsonKey(name: 'scheduledDate')
  DateTime get scheduledAt;
  @override
  ConsultationStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'studentNotes')
  String? get notes;
  @override
  @JsonKey(name: 'psychologistNotes')
  String? get summary;
  @override
  String? get recommendations;
  @override
  int get duration;
  @override
  double? get rating;
  @override
  String? get feedback;
  @override
  String? get meetingUrl;
  @override
  String? get cancellationReason;
  @override
  String? get psychologistName;
  @override
  String? get psychologistSpecialization;
  @override
  String? get userName;
  @override
  String? get userEmail;
  @override
  String? get psychologistEmail;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
