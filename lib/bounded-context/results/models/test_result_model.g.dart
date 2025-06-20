// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      id: json['id'] as String,
      testResultId: json['testResultId'] as String?,
      questionId: json['questionId'] as String?,
      selectedOptionId: json['selectedOptionId'] as String?,
      textAnswer: json['textAnswer'] as String?,
      pointsEarned: (json['pointsEarned'] as num?)?.toInt() ?? 0,
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testResultId': instance.testResultId,
      'questionId': instance.questionId,
      'selectedOptionId': instance.selectedOptionId,
      'textAnswer': instance.textAnswer,
      'pointsEarned': instance.pointsEarned,
      'isCorrect': instance.isCorrect,
    };

_$CareerRecommendationModelImpl _$$CareerRecommendationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CareerRecommendationModelImpl(
      careerId: json['careerId'] as String,
      careerName: json['careerName'] as String?,
      matchPercentage: (json['matchPercentage'] as num?)?.toDouble() ?? 0.0,
      reasoning: json['reasoning'] as String? ?? '',
    );

Map<String, dynamic> _$$CareerRecommendationModelImplToJson(
        _$CareerRecommendationModelImpl instance) =>
    <String, dynamic>{
      'careerId': instance.careerId,
      'careerName': instance.careerName,
      'matchPercentage': instance.matchPercentage,
      'reasoning': instance.reasoning,
    };

_$SubmitTestRequestModelImpl _$$SubmitTestRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitTestRequestModelImpl(
      testId: json['testId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => SubmitAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeSpent: (json['timeSpent'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SubmitTestRequestModelImplToJson(
        _$SubmitTestRequestModelImpl instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'answers': instance.answers,
      'timeSpent': instance.timeSpent,
    };

_$SubmitAnswerModelImpl _$$SubmitAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitAnswerModelImpl(
      questionId: json['questionId'] as String,
      selectedOptionId: json['selectedOptionId'] as String?,
      textAnswer: json['textAnswer'] as String?,
    );

Map<String, dynamic> _$$SubmitAnswerModelImplToJson(
        _$SubmitAnswerModelImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'selectedOptionId': instance.selectedOptionId,
      'textAnswer': instance.textAnswer,
    };
