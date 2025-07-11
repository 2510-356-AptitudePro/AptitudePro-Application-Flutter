// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CareerModel _$CareerModelFromJson(Map<String, dynamic> json) {
  return _CareerModel.fromJson(json);
}

/// @nodoc
mixin _$CareerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get fieldOfStudy => throw _privateConstructorUsedError;
  List<String>? get requiredSkills => throw _privateConstructorUsedError;
  JobProspectsModel? get jobProspects => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get degreeType => throw _privateConstructorUsedError;
  String? get curriculum => throw _privateConstructorUsedError;
  List<String>? get prerequisites => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<UniversityModel> get universities => throw _privateConstructorUsedError;

  /// Serializes this CareerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CareerModelCopyWith<CareerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CareerModelCopyWith<$Res> {
  factory $CareerModelCopyWith(
          CareerModel value, $Res Function(CareerModel) then) =
      _$CareerModelCopyWithImpl<$Res, CareerModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String fieldOfStudy,
      List<String>? requiredSkills,
      JobProspectsModel? jobProspects,
      int duration,
      String? degreeType,
      String? curriculum,
      List<String>? prerequisites,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      List<UniversityModel> universities});

  $JobProspectsModelCopyWith<$Res>? get jobProspects;
}

/// @nodoc
class _$CareerModelCopyWithImpl<$Res, $Val extends CareerModel>
    implements $CareerModelCopyWith<$Res> {
  _$CareerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? fieldOfStudy = null,
    Object? requiredSkills = freezed,
    Object? jobProspects = freezed,
    Object? duration = null,
    Object? degreeType = freezed,
    Object? curriculum = freezed,
    Object? prerequisites = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? universities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fieldOfStudy: null == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredSkills: freezed == requiredSkills
          ? _value.requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      jobProspects: freezed == jobProspects
          ? _value.jobProspects
          : jobProspects // ignore: cast_nullable_to_non_nullable
              as JobProspectsModel?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      degreeType: freezed == degreeType
          ? _value.degreeType
          : degreeType // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculum: freezed == curriculum
          ? _value.curriculum
          : curriculum // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisites: freezed == prerequisites
          ? _value.prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      universities: null == universities
          ? _value.universities
          : universities // ignore: cast_nullable_to_non_nullable
              as List<UniversityModel>,
    ) as $Val);
  }

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JobProspectsModelCopyWith<$Res>? get jobProspects {
    if (_value.jobProspects == null) {
      return null;
    }

    return $JobProspectsModelCopyWith<$Res>(_value.jobProspects!, (value) {
      return _then(_value.copyWith(jobProspects: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CareerModelImplCopyWith<$Res>
    implements $CareerModelCopyWith<$Res> {
  factory _$$CareerModelImplCopyWith(
          _$CareerModelImpl value, $Res Function(_$CareerModelImpl) then) =
      __$$CareerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String fieldOfStudy,
      List<String>? requiredSkills,
      JobProspectsModel? jobProspects,
      int duration,
      String? degreeType,
      String? curriculum,
      List<String>? prerequisites,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      List<UniversityModel> universities});

  @override
  $JobProspectsModelCopyWith<$Res>? get jobProspects;
}

/// @nodoc
class __$$CareerModelImplCopyWithImpl<$Res>
    extends _$CareerModelCopyWithImpl<$Res, _$CareerModelImpl>
    implements _$$CareerModelImplCopyWith<$Res> {
  __$$CareerModelImplCopyWithImpl(
      _$CareerModelImpl _value, $Res Function(_$CareerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? fieldOfStudy = null,
    Object? requiredSkills = freezed,
    Object? jobProspects = freezed,
    Object? duration = null,
    Object? degreeType = freezed,
    Object? curriculum = freezed,
    Object? prerequisites = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? universities = null,
  }) {
    return _then(_$CareerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fieldOfStudy: null == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredSkills: freezed == requiredSkills
          ? _value._requiredSkills
          : requiredSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      jobProspects: freezed == jobProspects
          ? _value.jobProspects
          : jobProspects // ignore: cast_nullable_to_non_nullable
              as JobProspectsModel?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      degreeType: freezed == degreeType
          ? _value.degreeType
          : degreeType // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculum: freezed == curriculum
          ? _value.curriculum
          : curriculum // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisites: freezed == prerequisites
          ? _value._prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      universities: null == universities
          ? _value._universities
          : universities // ignore: cast_nullable_to_non_nullable
              as List<UniversityModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CareerModelImpl extends _CareerModel {
  const _$CareerModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.fieldOfStudy,
      final List<String>? requiredSkills,
      this.jobProspects,
      required this.duration,
      this.degreeType,
      this.curriculum,
      final List<String>? prerequisites,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      final List<UniversityModel> universities = const []})
      : _requiredSkills = requiredSkills,
        _prerequisites = prerequisites,
        _universities = universities,
        super._();

  factory _$CareerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CareerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String fieldOfStudy;
  final List<String>? _requiredSkills;
  @override
  List<String>? get requiredSkills {
    final value = _requiredSkills;
    if (value == null) return null;
    if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final JobProspectsModel? jobProspects;
  @override
  final int duration;
  @override
  final String? degreeType;
  @override
  final String? curriculum;
  final List<String>? _prerequisites;
  @override
  List<String>? get prerequisites {
    final value = _prerequisites;
    if (value == null) return null;
    if (_prerequisites is EqualUnmodifiableListView) return _prerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<UniversityModel> _universities;
  @override
  @JsonKey()
  List<UniversityModel> get universities {
    if (_universities is EqualUnmodifiableListView) return _universities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_universities);
  }

  @override
  String toString() {
    return 'CareerModel(id: $id, name: $name, description: $description, fieldOfStudy: $fieldOfStudy, requiredSkills: $requiredSkills, jobProspects: $jobProspects, duration: $duration, degreeType: $degreeType, curriculum: $curriculum, prerequisites: $prerequisites, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, universities: $universities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CareerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fieldOfStudy, fieldOfStudy) ||
                other.fieldOfStudy == fieldOfStudy) &&
            const DeepCollectionEquality()
                .equals(other._requiredSkills, _requiredSkills) &&
            (identical(other.jobProspects, jobProspects) ||
                other.jobProspects == jobProspects) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.degreeType, degreeType) ||
                other.degreeType == degreeType) &&
            (identical(other.curriculum, curriculum) ||
                other.curriculum == curriculum) &&
            const DeepCollectionEquality()
                .equals(other._prerequisites, _prerequisites) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._universities, _universities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      fieldOfStudy,
      const DeepCollectionEquality().hash(_requiredSkills),
      jobProspects,
      duration,
      degreeType,
      curriculum,
      const DeepCollectionEquality().hash(_prerequisites),
      isActive,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_universities));

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CareerModelImplCopyWith<_$CareerModelImpl> get copyWith =>
      __$$CareerModelImplCopyWithImpl<_$CareerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CareerModelImplToJson(
      this,
    );
  }
}

abstract class _CareerModel extends CareerModel {
  const factory _CareerModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String fieldOfStudy,
      final List<String>? requiredSkills,
      final JobProspectsModel? jobProspects,
      required final int duration,
      final String? degreeType,
      final String? curriculum,
      final List<String>? prerequisites,
      required final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final List<UniversityModel> universities}) = _$CareerModelImpl;
  const _CareerModel._() : super._();

  factory _CareerModel.fromJson(Map<String, dynamic> json) =
      _$CareerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get fieldOfStudy;
  @override
  List<String>? get requiredSkills;
  @override
  JobProspectsModel? get jobProspects;
  @override
  int get duration;
  @override
  String? get degreeType;
  @override
  String? get curriculum;
  @override
  List<String>? get prerequisites;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<UniversityModel> get universities;

  /// Create a copy of CareerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CareerModelImplCopyWith<_$CareerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JobProspectsModel _$JobProspectsModelFromJson(Map<String, dynamic> json) {
  return _JobProspectsModel.fromJson(json);
}

/// @nodoc
mixin _$JobProspectsModel {
  double get averageSalary => throw _privateConstructorUsedError;
  double get employmentRate => throw _privateConstructorUsedError;
  String get growthProjection => throw _privateConstructorUsedError;
  List<String> get commonJobs => throw _privateConstructorUsedError;

  /// Serializes this JobProspectsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobProspectsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobProspectsModelCopyWith<JobProspectsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobProspectsModelCopyWith<$Res> {
  factory $JobProspectsModelCopyWith(
          JobProspectsModel value, $Res Function(JobProspectsModel) then) =
      _$JobProspectsModelCopyWithImpl<$Res, JobProspectsModel>;
  @useResult
  $Res call(
      {double averageSalary,
      double employmentRate,
      String growthProjection,
      List<String> commonJobs});
}

/// @nodoc
class _$JobProspectsModelCopyWithImpl<$Res, $Val extends JobProspectsModel>
    implements $JobProspectsModelCopyWith<$Res> {
  _$JobProspectsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobProspectsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageSalary = null,
    Object? employmentRate = null,
    Object? growthProjection = null,
    Object? commonJobs = null,
  }) {
    return _then(_value.copyWith(
      averageSalary: null == averageSalary
          ? _value.averageSalary
          : averageSalary // ignore: cast_nullable_to_non_nullable
              as double,
      employmentRate: null == employmentRate
          ? _value.employmentRate
          : employmentRate // ignore: cast_nullable_to_non_nullable
              as double,
      growthProjection: null == growthProjection
          ? _value.growthProjection
          : growthProjection // ignore: cast_nullable_to_non_nullable
              as String,
      commonJobs: null == commonJobs
          ? _value.commonJobs
          : commonJobs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobProspectsModelImplCopyWith<$Res>
    implements $JobProspectsModelCopyWith<$Res> {
  factory _$$JobProspectsModelImplCopyWith(_$JobProspectsModelImpl value,
          $Res Function(_$JobProspectsModelImpl) then) =
      __$$JobProspectsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double averageSalary,
      double employmentRate,
      String growthProjection,
      List<String> commonJobs});
}

/// @nodoc
class __$$JobProspectsModelImplCopyWithImpl<$Res>
    extends _$JobProspectsModelCopyWithImpl<$Res, _$JobProspectsModelImpl>
    implements _$$JobProspectsModelImplCopyWith<$Res> {
  __$$JobProspectsModelImplCopyWithImpl(_$JobProspectsModelImpl _value,
      $Res Function(_$JobProspectsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobProspectsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageSalary = null,
    Object? employmentRate = null,
    Object? growthProjection = null,
    Object? commonJobs = null,
  }) {
    return _then(_$JobProspectsModelImpl(
      averageSalary: null == averageSalary
          ? _value.averageSalary
          : averageSalary // ignore: cast_nullable_to_non_nullable
              as double,
      employmentRate: null == employmentRate
          ? _value.employmentRate
          : employmentRate // ignore: cast_nullable_to_non_nullable
              as double,
      growthProjection: null == growthProjection
          ? _value.growthProjection
          : growthProjection // ignore: cast_nullable_to_non_nullable
              as String,
      commonJobs: null == commonJobs
          ? _value._commonJobs
          : commonJobs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobProspectsModelImpl extends _JobProspectsModel {
  const _$JobProspectsModelImpl(
      {required this.averageSalary,
      required this.employmentRate,
      required this.growthProjection,
      required final List<String> commonJobs})
      : _commonJobs = commonJobs,
        super._();

  factory _$JobProspectsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobProspectsModelImplFromJson(json);

  @override
  final double averageSalary;
  @override
  final double employmentRate;
  @override
  final String growthProjection;
  final List<String> _commonJobs;
  @override
  List<String> get commonJobs {
    if (_commonJobs is EqualUnmodifiableListView) return _commonJobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonJobs);
  }

  @override
  String toString() {
    return 'JobProspectsModel(averageSalary: $averageSalary, employmentRate: $employmentRate, growthProjection: $growthProjection, commonJobs: $commonJobs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobProspectsModelImpl &&
            (identical(other.averageSalary, averageSalary) ||
                other.averageSalary == averageSalary) &&
            (identical(other.employmentRate, employmentRate) ||
                other.employmentRate == employmentRate) &&
            (identical(other.growthProjection, growthProjection) ||
                other.growthProjection == growthProjection) &&
            const DeepCollectionEquality()
                .equals(other._commonJobs, _commonJobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, averageSalary, employmentRate,
      growthProjection, const DeepCollectionEquality().hash(_commonJobs));

  /// Create a copy of JobProspectsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobProspectsModelImplCopyWith<_$JobProspectsModelImpl> get copyWith =>
      __$$JobProspectsModelImplCopyWithImpl<_$JobProspectsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobProspectsModelImplToJson(
      this,
    );
  }
}

abstract class _JobProspectsModel extends JobProspectsModel {
  const factory _JobProspectsModel(
      {required final double averageSalary,
      required final double employmentRate,
      required final String growthProjection,
      required final List<String> commonJobs}) = _$JobProspectsModelImpl;
  const _JobProspectsModel._() : super._();

  factory _JobProspectsModel.fromJson(Map<String, dynamic> json) =
      _$JobProspectsModelImpl.fromJson;

  @override
  double get averageSalary;
  @override
  double get employmentRate;
  @override
  String get growthProjection;
  @override
  List<String> get commonJobs;

  /// Create a copy of JobProspectsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobProspectsModelImplCopyWith<_$JobProspectsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UniversityModel _$UniversityModelFromJson(Map<String, dynamic> json) {
  return _UniversityModel.fromJson(json);
}

/// @nodoc
mixin _$UniversityModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<String>? get accreditations => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UniversityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UniversityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UniversityModelCopyWith<UniversityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityModelCopyWith<$Res> {
  factory $UniversityModelCopyWith(
          UniversityModel value, $Res Function(UniversityModel) then) =
      _$UniversityModelCopyWithImpl<$Res, UniversityModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String type,
      String? address,
      String? city,
      String? region,
      String? website,
      String? phone,
      String? email,
      List<String>? accreditations,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UniversityModelCopyWithImpl<$Res, $Val extends UniversityModel>
    implements $UniversityModelCopyWith<$Res> {
  _$UniversityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UniversityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? type = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? website = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? accreditations = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accreditations: freezed == accreditations
          ? _value.accreditations
          : accreditations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UniversityModelImplCopyWith<$Res>
    implements $UniversityModelCopyWith<$Res> {
  factory _$$UniversityModelImplCopyWith(_$UniversityModelImpl value,
          $Res Function(_$UniversityModelImpl) then) =
      __$$UniversityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String type,
      String? address,
      String? city,
      String? region,
      String? website,
      String? phone,
      String? email,
      List<String>? accreditations,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UniversityModelImplCopyWithImpl<$Res>
    extends _$UniversityModelCopyWithImpl<$Res, _$UniversityModelImpl>
    implements _$$UniversityModelImplCopyWith<$Res> {
  __$$UniversityModelImplCopyWithImpl(
      _$UniversityModelImpl _value, $Res Function(_$UniversityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UniversityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? type = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? website = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? accreditations = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UniversityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accreditations: freezed == accreditations
          ? _value._accreditations
          : accreditations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UniversityModelImpl extends _UniversityModel {
  const _$UniversityModelImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.type,
      this.address,
      this.city,
      this.region,
      this.website,
      this.phone,
      this.email,
      final List<String>? accreditations,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt})
      : _accreditations = accreditations,
        super._();

  factory _$UniversityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UniversityModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String type;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? website;
  @override
  final String? phone;
  @override
  final String? email;
  final List<String>? _accreditations;
  @override
  List<String>? get accreditations {
    final value = _accreditations;
    if (value == null) return null;
    if (_accreditations is EqualUnmodifiableListView) return _accreditations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UniversityModel(id: $id, name: $name, description: $description, type: $type, address: $address, city: $city, region: $region, website: $website, phone: $phone, email: $email, accreditations: $accreditations, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UniversityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._accreditations, _accreditations) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      const DeepCollectionEquality().hash(_accreditations),
      isActive,
      createdAt,
      updatedAt);

  /// Create a copy of UniversityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UniversityModelImplCopyWith<_$UniversityModelImpl> get copyWith =>
      __$$UniversityModelImplCopyWithImpl<_$UniversityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UniversityModelImplToJson(
      this,
    );
  }
}

abstract class _UniversityModel extends UniversityModel {
  const factory _UniversityModel(
      {required final String id,
      required final String name,
      final String? description,
      required final String type,
      final String? address,
      final String? city,
      final String? region,
      final String? website,
      final String? phone,
      final String? email,
      final List<String>? accreditations,
      required final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UniversityModelImpl;
  const _UniversityModel._() : super._();

  factory _UniversityModel.fromJson(Map<String, dynamic> json) =
      _$UniversityModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get type;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get website;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  List<String>? get accreditations;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UniversityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UniversityModelImplCopyWith<_$UniversityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
