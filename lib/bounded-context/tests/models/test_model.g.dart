// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: json['id'] as String,
      content: json['content'] as String?,
      imageUrl: json['imageUrl'] as String?,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      category: json['category'] as String?,
      points: (json['points'] as num?)?.toInt() ?? 1,
      testId: json['testId'] as String?,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'orderIndex': instance.orderIndex,
      'category': instance.category,
      'points': instance.points,
      'testId': instance.testId,
      'options': instance.options,
    };

_$OptionModelImpl _$$OptionModelImplFromJson(Map<String, dynamic> json) =>
    _$OptionModelImpl(
      id: json['id'] as String,
      content: json['content'] as String?,
      isCorrect: json['isCorrect'] as bool? ?? false,
      points: (json['points'] as num?)?.toInt() ?? 1,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      questionId: json['questionId'] as String?,
    );

Map<String, dynamic> _$$OptionModelImplToJson(_$OptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'isCorrect': instance.isCorrect,
      'points': instance.points,
      'orderIndex': instance.orderIndex,
      'questionId': instance.questionId,
    };
