// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'psychologist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Psychologist {
  String get id =>
      throw _privateConstructorUsedError; // ✅ Campos que SÍ vienen en tu JSON
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'profilePicture')
  String? get profileImage => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  DateTime? get createdAt =>
      throw _privateConstructorUsedError; // ✅ Campos opcionales con valores por defecto (NO vienen en tu JSON actual)
  String get specialization => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  int get yearsOfExperience => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalConsultations => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  List<AvailabilitySlot> get availability => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  double get consultationPrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of Psychologist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PsychologistCopyWith<Psychologist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PsychologistCopyWith<$Res> {
  factory $PsychologistCopyWith(
          Psychologist value, $Res Function(Psychologist) then) =
      _$PsychologistCopyWithImpl<$Res, Psychologist>;
  @useResult
  $Res call(
      {String id,
      String? firstName,
      String? lastName,
      String? email,
      String? username,
      @JsonKey(name: 'profilePicture') String? profileImage,
      String? bio,
      DateTime? createdAt,
      String specialization,
      String licenseNumber,
      int yearsOfExperience,
      double rating,
      int totalConsultations,
      List<String> languages,
      List<String> specialties,
      List<AvailabilitySlot> availability,
      bool isAvailable,
      double consultationPrice,
      String currency});
}

/// @nodoc
class _$PsychologistCopyWithImpl<$Res, $Val extends Psychologist>
    implements $PsychologistCopyWith<$Res> {
  _$PsychologistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Psychologist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? yearsOfExperience = null,
    Object? rating = null,
    Object? totalConsultations = null,
    Object? languages = null,
    Object? specialties = null,
    Object? availability = null,
    Object? isAvailable = null,
    Object? consultationPrice = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearsOfExperience: null == yearsOfExperience
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalConsultations: null == totalConsultations
          ? _value.totalConsultations
          : totalConsultations // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<AvailabilitySlot>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      consultationPrice: null == consultationPrice
          ? _value.consultationPrice
          : consultationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PsychologistImplCopyWith<$Res>
    implements $PsychologistCopyWith<$Res> {
  factory _$$PsychologistImplCopyWith(
          _$PsychologistImpl value, $Res Function(_$PsychologistImpl) then) =
      __$$PsychologistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? firstName,
      String? lastName,
      String? email,
      String? username,
      @JsonKey(name: 'profilePicture') String? profileImage,
      String? bio,
      DateTime? createdAt,
      String specialization,
      String licenseNumber,
      int yearsOfExperience,
      double rating,
      int totalConsultations,
      List<String> languages,
      List<String> specialties,
      List<AvailabilitySlot> availability,
      bool isAvailable,
      double consultationPrice,
      String currency});
}

/// @nodoc
class __$$PsychologistImplCopyWithImpl<$Res>
    extends _$PsychologistCopyWithImpl<$Res, _$PsychologistImpl>
    implements _$$PsychologistImplCopyWith<$Res> {
  __$$PsychologistImplCopyWithImpl(
      _$PsychologistImpl _value, $Res Function(_$PsychologistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Psychologist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? yearsOfExperience = null,
    Object? rating = null,
    Object? totalConsultations = null,
    Object? languages = null,
    Object? specialties = null,
    Object? availability = null,
    Object? isAvailable = null,
    Object? consultationPrice = null,
    Object? currency = null,
  }) {
    return _then(_$PsychologistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialization: null == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearsOfExperience: null == yearsOfExperience
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalConsultations: null == totalConsultations
          ? _value.totalConsultations
          : totalConsultations // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialties: null == specialties
          ? _value._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<AvailabilitySlot>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      consultationPrice: null == consultationPrice
          ? _value.consultationPrice
          : consultationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PsychologistImpl extends _Psychologist {
  const _$PsychologistImpl(
      {required this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      @JsonKey(name: 'profilePicture') this.profileImage,
      this.bio,
      this.createdAt,
      this.specialization = 'Psicología General',
      this.licenseNumber = '',
      this.yearsOfExperience = 0,
      this.rating = 0.0,
      this.totalConsultations = 0,
      final List<String> languages = const [],
      final List<String> specialties = const [],
      final List<AvailabilitySlot> availability = const [],
      this.isAvailable = true,
      this.consultationPrice = 0.0,
      this.currency = 'USD'})
      : _languages = languages,
        _specialties = specialties,
        _availability = availability,
        super._();

  @override
  final String id;
// ✅ Campos que SÍ vienen en tu JSON
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? username;
  @override
  @JsonKey(name: 'profilePicture')
  final String? profileImage;
  @override
  final String? bio;
  @override
  final DateTime? createdAt;
// ✅ Campos opcionales con valores por defecto (NO vienen en tu JSON actual)
  @override
  @JsonKey()
  final String specialization;
  @override
  @JsonKey()
  final String licenseNumber;
  @override
  @JsonKey()
  final int yearsOfExperience;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int totalConsultations;
  final List<String> _languages;
  @override
  @JsonKey()
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  final List<AvailabilitySlot> _availability;
  @override
  @JsonKey()
  List<AvailabilitySlot> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final double consultationPrice;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'Psychologist(id: $id, firstName: $firstName, lastName: $lastName, email: $email, username: $username, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, specialization: $specialization, licenseNumber: $licenseNumber, yearsOfExperience: $yearsOfExperience, rating: $rating, totalConsultations: $totalConsultations, languages: $languages, specialties: $specialties, availability: $availability, isAvailable: $isAvailable, consultationPrice: $consultationPrice, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PsychologistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.yearsOfExperience, yearsOfExperience) ||
                other.yearsOfExperience == yearsOfExperience) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalConsultations, totalConsultations) ||
                other.totalConsultations == totalConsultations) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.consultationPrice, consultationPrice) ||
                other.consultationPrice == consultationPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        email,
        username,
        profileImage,
        bio,
        createdAt,
        specialization,
        licenseNumber,
        yearsOfExperience,
        rating,
        totalConsultations,
        const DeepCollectionEquality().hash(_languages),
        const DeepCollectionEquality().hash(_specialties),
        const DeepCollectionEquality().hash(_availability),
        isAvailable,
        consultationPrice,
        currency
      ]);

  /// Create a copy of Psychologist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PsychologistImplCopyWith<_$PsychologistImpl> get copyWith =>
      __$$PsychologistImplCopyWithImpl<_$PsychologistImpl>(this, _$identity);
}

abstract class _Psychologist extends Psychologist {
  const factory _Psychologist(
      {required final String id,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? username,
      @JsonKey(name: 'profilePicture') final String? profileImage,
      final String? bio,
      final DateTime? createdAt,
      final String specialization,
      final String licenseNumber,
      final int yearsOfExperience,
      final double rating,
      final int totalConsultations,
      final List<String> languages,
      final List<String> specialties,
      final List<AvailabilitySlot> availability,
      final bool isAvailable,
      final double consultationPrice,
      final String currency}) = _$PsychologistImpl;
  const _Psychologist._() : super._();

  @override
  String get id; // ✅ Campos que SÍ vienen en tu JSON
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get username;
  @override
  @JsonKey(name: 'profilePicture')
  String? get profileImage;
  @override
  String? get bio;
  @override
  DateTime?
      get createdAt; // ✅ Campos opcionales con valores por defecto (NO vienen en tu JSON actual)
  @override
  String get specialization;
  @override
  String get licenseNumber;
  @override
  int get yearsOfExperience;
  @override
  double get rating;
  @override
  int get totalConsultations;
  @override
  List<String> get languages;
  @override
  List<String> get specialties;
  @override
  List<AvailabilitySlot> get availability;
  @override
  bool get isAvailable;
  @override
  double get consultationPrice;
  @override
  String get currency;

  /// Create a copy of Psychologist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PsychologistImplCopyWith<_$PsychologistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailabilitySlot _$AvailabilitySlotFromJson(Map<String, dynamic> json) {
  return _AvailabilitySlot.fromJson(json);
}

/// @nodoc
mixin _$AvailabilitySlot {
  String get dayOfWeek =>
      throw _privateConstructorUsedError; // 'monday', 'tuesday', etc.
  String get startTime => throw _privateConstructorUsedError; // '09:00'
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this AvailabilitySlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilitySlotCopyWith<AvailabilitySlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilitySlotCopyWith<$Res> {
  factory $AvailabilitySlotCopyWith(
          AvailabilitySlot value, $Res Function(AvailabilitySlot) then) =
      _$AvailabilitySlotCopyWithImpl<$Res, AvailabilitySlot>;
  @useResult
  $Res call({String dayOfWeek, String startTime, String endTime});
}

/// @nodoc
class _$AvailabilitySlotCopyWithImpl<$Res, $Val extends AvailabilitySlot>
    implements $AvailabilitySlotCopyWith<$Res> {
  _$AvailabilitySlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilitySlotImplCopyWith<$Res>
    implements $AvailabilitySlotCopyWith<$Res> {
  factory _$$AvailabilitySlotImplCopyWith(_$AvailabilitySlotImpl value,
          $Res Function(_$AvailabilitySlotImpl) then) =
      __$$AvailabilitySlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dayOfWeek, String startTime, String endTime});
}

/// @nodoc
class __$$AvailabilitySlotImplCopyWithImpl<$Res>
    extends _$AvailabilitySlotCopyWithImpl<$Res, _$AvailabilitySlotImpl>
    implements _$$AvailabilitySlotImplCopyWith<$Res> {
  __$$AvailabilitySlotImplCopyWithImpl(_$AvailabilitySlotImpl _value,
      $Res Function(_$AvailabilitySlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$AvailabilitySlotImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilitySlotImpl extends _AvailabilitySlot {
  const _$AvailabilitySlotImpl(
      {required this.dayOfWeek, required this.startTime, required this.endTime})
      : super._();

  factory _$AvailabilitySlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilitySlotImplFromJson(json);

  @override
  final String dayOfWeek;
// 'monday', 'tuesday', etc.
  @override
  final String startTime;
// '09:00'
  @override
  final String endTime;

  @override
  String toString() {
    return 'AvailabilitySlot(dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilitySlotImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek, startTime, endTime);

  /// Create a copy of AvailabilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilitySlotImplCopyWith<_$AvailabilitySlotImpl> get copyWith =>
      __$$AvailabilitySlotImplCopyWithImpl<_$AvailabilitySlotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilitySlotImplToJson(
      this,
    );
  }
}

abstract class _AvailabilitySlot extends AvailabilitySlot {
  const factory _AvailabilitySlot(
      {required final String dayOfWeek,
      required final String startTime,
      required final String endTime}) = _$AvailabilitySlotImpl;
  const _AvailabilitySlot._() : super._();

  factory _AvailabilitySlot.fromJson(Map<String, dynamic> json) =
      _$AvailabilitySlotImpl.fromJson;

  @override
  String get dayOfWeek; // 'monday', 'tuesday', etc.
  @override
  String get startTime; // '09:00'
  @override
  String get endTime;

  /// Create a copy of AvailabilitySlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilitySlotImplCopyWith<_$AvailabilitySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
