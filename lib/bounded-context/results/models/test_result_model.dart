import 'package:aptitude_pro_app/bounded-context/tests/models/test_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/test_result.dart';

part 'test_result_model.freezed.dart';
part 'test_result_model.g.dart';

@freezed
class TestResultModel with _$TestResultModel {
  const factory TestResultModel({
    required String id,
    String? userId,
    String? testId,
    @JsonKey(name: 'scores') Map<String, dynamic>? scoresData,
    Map<String, dynamic>? aptitudeProfile,
    @Default([]) List<CareerRecommendationModel> careerRecommendations,
    @Default(0) int timeSpent,
    @Default(true) bool isCompleted,
    DateTime? completedAt,
    TestModel? test,
    @Default([]) List<AnswerModel> answers,
  }) = _TestResultModel;

  const TestResultModel._();

  // ✅ CUSTOM fromJson para manejar la estructura específica de tu API
  factory TestResultModel.fromJson(Map<String, dynamic> json) {
    return TestResultModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String?,
      testId: json['testId'] as String?,
      scoresData: json['scores'] as Map<String, dynamic>?,
      aptitudeProfile: json['aptitudeProfile'] as Map<String, dynamic>?,
      careerRecommendations: json['careerRecommendations'] != null
          ? (json['careerRecommendations'] as List)
          .map((e) => CareerRecommendationModel.fromJson(e as Map<String, dynamic>))
          .toList()
          : [],
      timeSpent: json['timeSpent'] as int? ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? true,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      test: json['test'] != null
          ? TestModel.fromJson(json['test'] as Map<String, dynamic>)
          : null,
      answers: json['answers'] != null
          ? (json['answers'] as List)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'testId': testId,
      'scores': scoresData,
      'aptitudeProfile': aptitudeProfile,
      'careerRecommendations': careerRecommendations.map((e) => e.toJson()).toList(),
      'timeSpent': timeSpent,
      'isCompleted': isCompleted,
      'completedAt': completedAt?.toIso8601String(),
      'test': test?.toJson(),
      'answers': answers.map((e) => e.toJson()).toList(),
    };
  }

  TestResult toEntity() => TestResult(
    id: id,
    userId: userId ?? '',
    testId: testId ?? test?.id ?? '',
    scores: scoresData != null ? TestScores.fromMap(scoresData!) : null,
    aptitudeProfile: aptitudeProfile != null
        ? AptitudeProfile.fromMap(aptitudeProfile!) : null,
    careerRecommendations: careerRecommendations
        .map((c) => c.toEntity()).toList(),
    timeSpent: timeSpent,
    isCompleted: isCompleted,
    completedAt: completedAt ?? DateTime.now(),
    test: test?.toEntity(),
    answers: answers.map((a) => a.toEntity()).toList(),
  );
}

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required String id,
    String? testResultId,
    String? questionId,
    String? selectedOptionId,
    String? textAnswer,
    @Default(0) int pointsEarned,
    @Default(false) bool isCorrect,
  }) = _AnswerModel;

  const AnswerModel._();

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Answer toEntity() => Answer(
    id: id,
    testResultId: testResultId ?? '',
    questionId: questionId ?? '',
    selectedOptionId: selectedOptionId,
    textAnswer: textAnswer,
    pointsEarned: pointsEarned,
    isCorrect: isCorrect,
  );
}

@freezed
class CareerRecommendationModel with _$CareerRecommendationModel {
  const factory CareerRecommendationModel({
    required String careerId,
    String? careerName,
    @Default(0.0) double matchPercentage,
    @Default('') String reasoning,
  }) = _CareerRecommendationModel;

  const CareerRecommendationModel._();

  factory CareerRecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$CareerRecommendationModelFromJson(json);

  CareerRecommendation toEntity() => CareerRecommendation(
    careerId: careerId,
    careerName: careerName ?? '',
    matchPercentage: matchPercentage,
    reasoning: reasoning,
  );
}

@freezed
class SubmitTestRequestModel with _$SubmitTestRequestModel {
  const factory SubmitTestRequestModel({
    required String testId,
    required List<SubmitAnswerModel> answers,
    @Default(0) int timeSpent,
  }) = _SubmitTestRequestModel;

  factory SubmitTestRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitTestRequestModelFromJson(json);
}

@freezed
class SubmitAnswerModel with _$SubmitAnswerModel {
  const factory SubmitAnswerModel({
    required String questionId,
    String? selectedOptionId,
    String? textAnswer,
  }) = _SubmitAnswerModel;

  factory SubmitAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerModelFromJson(json);
}