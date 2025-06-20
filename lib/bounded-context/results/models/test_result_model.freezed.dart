// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestResultModel {
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get testId => throw _privateConstructorUsedError;
  @JsonKey(name: 'scores')
  Map<String, dynamic>? get scoresData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get aptitudeProfile =>
      throw _privateConstructorUsedError;
  List<CareerRecommendationModel> get careerRecommendations =>
      throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  TestModel? get test => throw _privateConstructorUsedError;
  List<AnswerModel> get answers => throw _privateConstructorUsedError;

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestResultModelCopyWith<TestResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestResultModelCopyWith<$Res> {
  factory $TestResultModelCopyWith(
          TestResultModel value, $Res Function(TestResultModel) then) =
      _$TestResultModelCopyWithImpl<$Res, TestResultModel>;
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? testId,
      @JsonKey(name: 'scores') Map<String, dynamic>? scoresData,
      Map<String, dynamic>? aptitudeProfile,
      List<CareerRecommendationModel> careerRecommendations,
      int timeSpent,
      bool isCompleted,
      DateTime? completedAt,
      TestModel? test,
      List<AnswerModel> answers});

  $TestModelCopyWith<$Res>? get test;
}

/// @nodoc
class _$TestResultModelCopyWithImpl<$Res, $Val extends TestResultModel>
    implements $TestResultModelCopyWith<$Res> {
  _$TestResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? testId = freezed,
    Object? scoresData = freezed,
    Object? aptitudeProfile = freezed,
    Object? careerRecommendations = null,
    Object? timeSpent = null,
    Object? isCompleted = null,
    Object? completedAt = freezed,
    Object? test = freezed,
    Object? answers = null,
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
      testId: freezed == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String?,
      scoresData: freezed == scoresData
          ? _value.scoresData
          : scoresData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      aptitudeProfile: freezed == aptitudeProfile
          ? _value.aptitudeProfile
          : aptitudeProfile // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      careerRecommendations: null == careerRecommendations
          ? _value.careerRecommendations
          : careerRecommendations // ignore: cast_nullable_to_non_nullable
              as List<CareerRecommendationModel>,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as TestModel?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
    ) as $Val);
  }

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TestModelCopyWith<$Res>? get test {
    if (_value.test == null) {
      return null;
    }

    return $TestModelCopyWith<$Res>(_value.test!, (value) {
      return _then(_value.copyWith(test: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TestResultModelImplCopyWith<$Res>
    implements $TestResultModelCopyWith<$Res> {
  factory _$$TestResultModelImplCopyWith(_$TestResultModelImpl value,
          $Res Function(_$TestResultModelImpl) then) =
      __$$TestResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? testId,
      @JsonKey(name: 'scores') Map<String, dynamic>? scoresData,
      Map<String, dynamic>? aptitudeProfile,
      List<CareerRecommendationModel> careerRecommendations,
      int timeSpent,
      bool isCompleted,
      DateTime? completedAt,
      TestModel? test,
      List<AnswerModel> answers});

  @override
  $TestModelCopyWith<$Res>? get test;
}

/// @nodoc
class __$$TestResultModelImplCopyWithImpl<$Res>
    extends _$TestResultModelCopyWithImpl<$Res, _$TestResultModelImpl>
    implements _$$TestResultModelImplCopyWith<$Res> {
  __$$TestResultModelImplCopyWithImpl(
      _$TestResultModelImpl _value, $Res Function(_$TestResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? testId = freezed,
    Object? scoresData = freezed,
    Object? aptitudeProfile = freezed,
    Object? careerRecommendations = null,
    Object? timeSpent = null,
    Object? isCompleted = null,
    Object? completedAt = freezed,
    Object? test = freezed,
    Object? answers = null,
  }) {
    return _then(_$TestResultModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      testId: freezed == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String?,
      scoresData: freezed == scoresData
          ? _value._scoresData
          : scoresData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      aptitudeProfile: freezed == aptitudeProfile
          ? _value._aptitudeProfile
          : aptitudeProfile // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      careerRecommendations: null == careerRecommendations
          ? _value._careerRecommendations
          : careerRecommendations // ignore: cast_nullable_to_non_nullable
              as List<CareerRecommendationModel>,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as TestModel?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
    ));
  }
}

/// @nodoc

class _$TestResultModelImpl extends _TestResultModel {
  const _$TestResultModelImpl(
      {required this.id,
      this.userId,
      this.testId,
      @JsonKey(name: 'scores') final Map<String, dynamic>? scoresData,
      final Map<String, dynamic>? aptitudeProfile,
      final List<CareerRecommendationModel> careerRecommendations = const [],
      this.timeSpent = 0,
      this.isCompleted = true,
      this.completedAt,
      this.test,
      final List<AnswerModel> answers = const []})
      : _scoresData = scoresData,
        _aptitudeProfile = aptitudeProfile,
        _careerRecommendations = careerRecommendations,
        _answers = answers,
        super._();

  @override
  final String id;
  @override
  final String? userId;
  @override
  final String? testId;
  final Map<String, dynamic>? _scoresData;
  @override
  @JsonKey(name: 'scores')
  Map<String, dynamic>? get scoresData {
    final value = _scoresData;
    if (value == null) return null;
    if (_scoresData is EqualUnmodifiableMapView) return _scoresData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _aptitudeProfile;
  @override
  Map<String, dynamic>? get aptitudeProfile {
    final value = _aptitudeProfile;
    if (value == null) return null;
    if (_aptitudeProfile is EqualUnmodifiableMapView) return _aptitudeProfile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<CareerRecommendationModel> _careerRecommendations;
  @override
  @JsonKey()
  List<CareerRecommendationModel> get careerRecommendations {
    if (_careerRecommendations is EqualUnmodifiableListView)
      return _careerRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_careerRecommendations);
  }

  @override
  @JsonKey()
  final int timeSpent;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime? completedAt;
  @override
  final TestModel? test;
  final List<AnswerModel> _answers;
  @override
  @JsonKey()
  List<AnswerModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'TestResultModel(id: $id, userId: $userId, testId: $testId, scoresData: $scoresData, aptitudeProfile: $aptitudeProfile, careerRecommendations: $careerRecommendations, timeSpent: $timeSpent, isCompleted: $isCompleted, completedAt: $completedAt, test: $test, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestResultModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality()
                .equals(other._scoresData, _scoresData) &&
            const DeepCollectionEquality()
                .equals(other._aptitudeProfile, _aptitudeProfile) &&
            const DeepCollectionEquality()
                .equals(other._careerRecommendations, _careerRecommendations) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.test, test) || other.test == test) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      testId,
      const DeepCollectionEquality().hash(_scoresData),
      const DeepCollectionEquality().hash(_aptitudeProfile),
      const DeepCollectionEquality().hash(_careerRecommendations),
      timeSpent,
      isCompleted,
      completedAt,
      test,
      const DeepCollectionEquality().hash(_answers));

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestResultModelImplCopyWith<_$TestResultModelImpl> get copyWith =>
      __$$TestResultModelImplCopyWithImpl<_$TestResultModelImpl>(
          this, _$identity);
}

abstract class _TestResultModel extends TestResultModel {
  const factory _TestResultModel(
      {required final String id,
      final String? userId,
      final String? testId,
      @JsonKey(name: 'scores') final Map<String, dynamic>? scoresData,
      final Map<String, dynamic>? aptitudeProfile,
      final List<CareerRecommendationModel> careerRecommendations,
      final int timeSpent,
      final bool isCompleted,
      final DateTime? completedAt,
      final TestModel? test,
      final List<AnswerModel> answers}) = _$TestResultModelImpl;
  const _TestResultModel._() : super._();

  @override
  String get id;
  @override
  String? get userId;
  @override
  String? get testId;
  @override
  @JsonKey(name: 'scores')
  Map<String, dynamic>? get scoresData;
  @override
  Map<String, dynamic>? get aptitudeProfile;
  @override
  List<CareerRecommendationModel> get careerRecommendations;
  @override
  int get timeSpent;
  @override
  bool get isCompleted;
  @override
  DateTime? get completedAt;
  @override
  TestModel? get test;
  @override
  List<AnswerModel> get answers;

  /// Create a copy of TestResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestResultModelImplCopyWith<_$TestResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  String get id => throw _privateConstructorUsedError;
  String? get testResultId => throw _privateConstructorUsedError;
  String? get questionId => throw _privateConstructorUsedError;
  String? get selectedOptionId => throw _privateConstructorUsedError;
  String? get textAnswer => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this AnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call(
      {String id,
      String? testResultId,
      String? questionId,
      String? selectedOptionId,
      String? textAnswer,
      int pointsEarned,
      bool isCorrect});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testResultId = freezed,
    Object? questionId = freezed,
    Object? selectedOptionId = freezed,
    Object? textAnswer = freezed,
    Object? pointsEarned = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      testResultId: freezed == testResultId
          ? _value.testResultId
          : testResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerModelImplCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$AnswerModelImplCopyWith(
          _$AnswerModelImpl value, $Res Function(_$AnswerModelImpl) then) =
      __$$AnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? testResultId,
      String? questionId,
      String? selectedOptionId,
      String? textAnswer,
      int pointsEarned,
      bool isCorrect});
}

/// @nodoc
class __$$AnswerModelImplCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$AnswerModelImpl>
    implements _$$AnswerModelImplCopyWith<$Res> {
  __$$AnswerModelImplCopyWithImpl(
      _$AnswerModelImpl _value, $Res Function(_$AnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testResultId = freezed,
    Object? questionId = freezed,
    Object? selectedOptionId = freezed,
    Object? textAnswer = freezed,
    Object? pointsEarned = null,
    Object? isCorrect = null,
  }) {
    return _then(_$AnswerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      testResultId: freezed == testResultId
          ? _value.testResultId
          : testResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerModelImpl extends _AnswerModel {
  const _$AnswerModelImpl(
      {required this.id,
      this.testResultId,
      this.questionId,
      this.selectedOptionId,
      this.textAnswer,
      this.pointsEarned = 0,
      this.isCorrect = false})
      : super._();

  factory _$AnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? testResultId;
  @override
  final String? questionId;
  @override
  final String? selectedOptionId;
  @override
  final String? textAnswer;
  @override
  @JsonKey()
  final int pointsEarned;
  @override
  @JsonKey()
  final bool isCorrect;

  @override
  String toString() {
    return 'AnswerModel(id: $id, testResultId: $testResultId, questionId: $questionId, selectedOptionId: $selectedOptionId, textAnswer: $textAnswer, pointsEarned: $pointsEarned, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testResultId, testResultId) ||
                other.testResultId == testResultId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionId, selectedOptionId) ||
                other.selectedOptionId == selectedOptionId) &&
            (identical(other.textAnswer, textAnswer) ||
                other.textAnswer == textAnswer) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, testResultId, questionId,
      selectedOptionId, textAnswer, pointsEarned, isCorrect);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      __$$AnswerModelImplCopyWithImpl<_$AnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerModel extends AnswerModel {
  const factory _AnswerModel(
      {required final String id,
      final String? testResultId,
      final String? questionId,
      final String? selectedOptionId,
      final String? textAnswer,
      final int pointsEarned,
      final bool isCorrect}) = _$AnswerModelImpl;
  const _AnswerModel._() : super._();

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$AnswerModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get testResultId;
  @override
  String? get questionId;
  @override
  String? get selectedOptionId;
  @override
  String? get textAnswer;
  @override
  int get pointsEarned;
  @override
  bool get isCorrect;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CareerRecommendationModel _$CareerRecommendationModelFromJson(
    Map<String, dynamic> json) {
  return _CareerRecommendationModel.fromJson(json);
}

/// @nodoc
mixin _$CareerRecommendationModel {
  String get careerId => throw _privateConstructorUsedError;
  String? get careerName => throw _privateConstructorUsedError;
  double get matchPercentage => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;

  /// Serializes this CareerRecommendationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CareerRecommendationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CareerRecommendationModelCopyWith<CareerRecommendationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CareerRecommendationModelCopyWith<$Res> {
  factory $CareerRecommendationModelCopyWith(CareerRecommendationModel value,
          $Res Function(CareerRecommendationModel) then) =
      _$CareerRecommendationModelCopyWithImpl<$Res, CareerRecommendationModel>;
  @useResult
  $Res call(
      {String careerId,
      String? careerName,
      double matchPercentage,
      String reasoning});
}

/// @nodoc
class _$CareerRecommendationModelCopyWithImpl<$Res,
        $Val extends CareerRecommendationModel>
    implements $CareerRecommendationModelCopyWith<$Res> {
  _$CareerRecommendationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CareerRecommendationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? careerId = null,
    Object? careerName = freezed,
    Object? matchPercentage = null,
    Object? reasoning = null,
  }) {
    return _then(_value.copyWith(
      careerId: null == careerId
          ? _value.careerId
          : careerId // ignore: cast_nullable_to_non_nullable
              as String,
      careerName: freezed == careerName
          ? _value.careerName
          : careerName // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPercentage: null == matchPercentage
          ? _value.matchPercentage
          : matchPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CareerRecommendationModelImplCopyWith<$Res>
    implements $CareerRecommendationModelCopyWith<$Res> {
  factory _$$CareerRecommendationModelImplCopyWith(
          _$CareerRecommendationModelImpl value,
          $Res Function(_$CareerRecommendationModelImpl) then) =
      __$$CareerRecommendationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String careerId,
      String? careerName,
      double matchPercentage,
      String reasoning});
}

/// @nodoc
class __$$CareerRecommendationModelImplCopyWithImpl<$Res>
    extends _$CareerRecommendationModelCopyWithImpl<$Res,
        _$CareerRecommendationModelImpl>
    implements _$$CareerRecommendationModelImplCopyWith<$Res> {
  __$$CareerRecommendationModelImplCopyWithImpl(
      _$CareerRecommendationModelImpl _value,
      $Res Function(_$CareerRecommendationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CareerRecommendationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? careerId = null,
    Object? careerName = freezed,
    Object? matchPercentage = null,
    Object? reasoning = null,
  }) {
    return _then(_$CareerRecommendationModelImpl(
      careerId: null == careerId
          ? _value.careerId
          : careerId // ignore: cast_nullable_to_non_nullable
              as String,
      careerName: freezed == careerName
          ? _value.careerName
          : careerName // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPercentage: null == matchPercentage
          ? _value.matchPercentage
          : matchPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CareerRecommendationModelImpl extends _CareerRecommendationModel {
  const _$CareerRecommendationModelImpl(
      {required this.careerId,
      this.careerName,
      this.matchPercentage = 0.0,
      this.reasoning = ''})
      : super._();

  factory _$CareerRecommendationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CareerRecommendationModelImplFromJson(json);

  @override
  final String careerId;
  @override
  final String? careerName;
  @override
  @JsonKey()
  final double matchPercentage;
  @override
  @JsonKey()
  final String reasoning;

  @override
  String toString() {
    return 'CareerRecommendationModel(careerId: $careerId, careerName: $careerName, matchPercentage: $matchPercentage, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CareerRecommendationModelImpl &&
            (identical(other.careerId, careerId) ||
                other.careerId == careerId) &&
            (identical(other.careerName, careerName) ||
                other.careerName == careerName) &&
            (identical(other.matchPercentage, matchPercentage) ||
                other.matchPercentage == matchPercentage) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, careerId, careerName, matchPercentage, reasoning);

  /// Create a copy of CareerRecommendationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CareerRecommendationModelImplCopyWith<_$CareerRecommendationModelImpl>
      get copyWith => __$$CareerRecommendationModelImplCopyWithImpl<
          _$CareerRecommendationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CareerRecommendationModelImplToJson(
      this,
    );
  }
}

abstract class _CareerRecommendationModel extends CareerRecommendationModel {
  const factory _CareerRecommendationModel(
      {required final String careerId,
      final String? careerName,
      final double matchPercentage,
      final String reasoning}) = _$CareerRecommendationModelImpl;
  const _CareerRecommendationModel._() : super._();

  factory _CareerRecommendationModel.fromJson(Map<String, dynamic> json) =
      _$CareerRecommendationModelImpl.fromJson;

  @override
  String get careerId;
  @override
  String? get careerName;
  @override
  double get matchPercentage;
  @override
  String get reasoning;

  /// Create a copy of CareerRecommendationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CareerRecommendationModelImplCopyWith<_$CareerRecommendationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubmitTestRequestModel _$SubmitTestRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SubmitTestRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SubmitTestRequestModel {
  String get testId => throw _privateConstructorUsedError;
  List<SubmitAnswerModel> get answers => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;

  /// Serializes this SubmitTestRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitTestRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitTestRequestModelCopyWith<SubmitTestRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTestRequestModelCopyWith<$Res> {
  factory $SubmitTestRequestModelCopyWith(SubmitTestRequestModel value,
          $Res Function(SubmitTestRequestModel) then) =
      _$SubmitTestRequestModelCopyWithImpl<$Res, SubmitTestRequestModel>;
  @useResult
  $Res call({String testId, List<SubmitAnswerModel> answers, int timeSpent});
}

/// @nodoc
class _$SubmitTestRequestModelCopyWithImpl<$Res,
        $Val extends SubmitTestRequestModel>
    implements $SubmitTestRequestModelCopyWith<$Res> {
  _$SubmitTestRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitTestRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? answers = null,
    Object? timeSpent = null,
  }) {
    return _then(_value.copyWith(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<SubmitAnswerModel>,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitTestRequestModelImplCopyWith<$Res>
    implements $SubmitTestRequestModelCopyWith<$Res> {
  factory _$$SubmitTestRequestModelImplCopyWith(
          _$SubmitTestRequestModelImpl value,
          $Res Function(_$SubmitTestRequestModelImpl) then) =
      __$$SubmitTestRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String testId, List<SubmitAnswerModel> answers, int timeSpent});
}

/// @nodoc
class __$$SubmitTestRequestModelImplCopyWithImpl<$Res>
    extends _$SubmitTestRequestModelCopyWithImpl<$Res,
        _$SubmitTestRequestModelImpl>
    implements _$$SubmitTestRequestModelImplCopyWith<$Res> {
  __$$SubmitTestRequestModelImplCopyWithImpl(
      _$SubmitTestRequestModelImpl _value,
      $Res Function(_$SubmitTestRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitTestRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? answers = null,
    Object? timeSpent = null,
  }) {
    return _then(_$SubmitTestRequestModelImpl(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<SubmitAnswerModel>,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitTestRequestModelImpl implements _SubmitTestRequestModel {
  const _$SubmitTestRequestModelImpl(
      {required this.testId,
      required final List<SubmitAnswerModel> answers,
      this.timeSpent = 0})
      : _answers = answers;

  factory _$SubmitTestRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitTestRequestModelImplFromJson(json);

  @override
  final String testId;
  final List<SubmitAnswerModel> _answers;
  @override
  List<SubmitAnswerModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey()
  final int timeSpent;

  @override
  String toString() {
    return 'SubmitTestRequestModel(testId: $testId, answers: $answers, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTestRequestModelImpl &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testId,
      const DeepCollectionEquality().hash(_answers), timeSpent);

  /// Create a copy of SubmitTestRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTestRequestModelImplCopyWith<_$SubmitTestRequestModelImpl>
      get copyWith => __$$SubmitTestRequestModelImplCopyWithImpl<
          _$SubmitTestRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitTestRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SubmitTestRequestModel implements SubmitTestRequestModel {
  const factory _SubmitTestRequestModel(
      {required final String testId,
      required final List<SubmitAnswerModel> answers,
      final int timeSpent}) = _$SubmitTestRequestModelImpl;

  factory _SubmitTestRequestModel.fromJson(Map<String, dynamic> json) =
      _$SubmitTestRequestModelImpl.fromJson;

  @override
  String get testId;
  @override
  List<SubmitAnswerModel> get answers;
  @override
  int get timeSpent;

  /// Create a copy of SubmitTestRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitTestRequestModelImplCopyWith<_$SubmitTestRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubmitAnswerModel _$SubmitAnswerModelFromJson(Map<String, dynamic> json) {
  return _SubmitAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$SubmitAnswerModel {
  String get questionId => throw _privateConstructorUsedError;
  String? get selectedOptionId => throw _privateConstructorUsedError;
  String? get textAnswer => throw _privateConstructorUsedError;

  /// Serializes this SubmitAnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitAnswerModelCopyWith<SubmitAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitAnswerModelCopyWith<$Res> {
  factory $SubmitAnswerModelCopyWith(
          SubmitAnswerModel value, $Res Function(SubmitAnswerModel) then) =
      _$SubmitAnswerModelCopyWithImpl<$Res, SubmitAnswerModel>;
  @useResult
  $Res call({String questionId, String? selectedOptionId, String? textAnswer});
}

/// @nodoc
class _$SubmitAnswerModelCopyWithImpl<$Res, $Val extends SubmitAnswerModel>
    implements $SubmitAnswerModelCopyWith<$Res> {
  _$SubmitAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedOptionId = freezed,
    Object? textAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitAnswerModelImplCopyWith<$Res>
    implements $SubmitAnswerModelCopyWith<$Res> {
  factory _$$SubmitAnswerModelImplCopyWith(_$SubmitAnswerModelImpl value,
          $Res Function(_$SubmitAnswerModelImpl) then) =
      __$$SubmitAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionId, String? selectedOptionId, String? textAnswer});
}

/// @nodoc
class __$$SubmitAnswerModelImplCopyWithImpl<$Res>
    extends _$SubmitAnswerModelCopyWithImpl<$Res, _$SubmitAnswerModelImpl>
    implements _$$SubmitAnswerModelImplCopyWith<$Res> {
  __$$SubmitAnswerModelImplCopyWithImpl(_$SubmitAnswerModelImpl _value,
      $Res Function(_$SubmitAnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedOptionId = freezed,
    Object? textAnswer = freezed,
  }) {
    return _then(_$SubmitAnswerModelImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      textAnswer: freezed == textAnswer
          ? _value.textAnswer
          : textAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitAnswerModelImpl implements _SubmitAnswerModel {
  const _$SubmitAnswerModelImpl(
      {required this.questionId, this.selectedOptionId, this.textAnswer});

  factory _$SubmitAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitAnswerModelImplFromJson(json);

  @override
  final String questionId;
  @override
  final String? selectedOptionId;
  @override
  final String? textAnswer;

  @override
  String toString() {
    return 'SubmitAnswerModel(questionId: $questionId, selectedOptionId: $selectedOptionId, textAnswer: $textAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitAnswerModelImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionId, selectedOptionId) ||
                other.selectedOptionId == selectedOptionId) &&
            (identical(other.textAnswer, textAnswer) ||
                other.textAnswer == textAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionId, selectedOptionId, textAnswer);

  /// Create a copy of SubmitAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitAnswerModelImplCopyWith<_$SubmitAnswerModelImpl> get copyWith =>
      __$$SubmitAnswerModelImplCopyWithImpl<_$SubmitAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _SubmitAnswerModel implements SubmitAnswerModel {
  const factory _SubmitAnswerModel(
      {required final String questionId,
      final String? selectedOptionId,
      final String? textAnswer}) = _$SubmitAnswerModelImpl;

  factory _SubmitAnswerModel.fromJson(Map<String, dynamic> json) =
      _$SubmitAnswerModelImpl.fromJson;

  @override
  String get questionId;
  @override
  String? get selectedOptionId;
  @override
  String? get textAnswer;

  /// Create a copy of SubmitAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitAnswerModelImplCopyWith<_$SubmitAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
