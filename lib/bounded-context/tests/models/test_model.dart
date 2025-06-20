import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/test.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';

@freezed
class TestModel with _$TestModel {
  const factory TestModel({
    required String id,
    String? title,
    String? description,
    String? type,
    @Default(0) int duration,
    @Default(true) bool isActive,
    String? instructions,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<QuestionModel> questions,
    @Default(0) int questionCount,
  }) = _TestModel;

  const TestModel._();

  // ✅ CUSTOM fromJson que maneja campos faltantes de forma segura
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      duration: json['duration'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      instructions: json['instructions'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      questions: json['questions'] != null
          ? (json['questions'] as List)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList()
          : [],
      questionCount: json['questionCount'] as int? ?? 0,
    );
  }

  // ✅ IMPLEMENTACIÓN CORRECTA de toJson()
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      'duration': duration,
      'isActive': isActive,
      if (instructions != null) 'instructions': instructions,
      if (createdBy != null) 'createdBy': createdBy,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (questions.isNotEmpty) 'questions': questions.map((q) => q.toJson()).toList(),
      'questionCount': questionCount,
    };
  }

  Test toEntity() => Test(
    id: id,
    title: title ?? 'Sin título',
    description: description ?? '',
    type: TestType.fromString(type ?? 'aptitude'),
    duration: duration,
    isActive: isActive,
    instructions: instructions,
    createdBy: createdBy,
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: updatedAt ?? DateTime.now(),
    questions: questions.isEmpty ? [] : questions.map((q) => q.toEntity()).toList(),
    questionCount: questionCount,
  );
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    String? content,
    String? imageUrl,
    @Default(0) int orderIndex,
    String? category,
    @Default(1) int points,
    String? testId,
    @Default([]) List<OptionModel> options,
  }) = _QuestionModel;

  const QuestionModel._();

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  // ✅ IMPLEMENTACIÓN CORRECTA de toJson() para QuestionModel
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (content != null) 'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'orderIndex': orderIndex,
      if (category != null) 'category': category,
      'points': points,
      if (testId != null) 'testId': testId,
      if (options.isNotEmpty) 'options': options.map((o) => o.toJson()).toList(),
    };
  }

  Question toEntity() => Question(
    id: id,
    content: content ?? '',
    imageUrl: imageUrl,
    orderIndex: orderIndex,
    category: category,
    points: points,
    testId: testId ?? '',
    options: options.map((o) => o.toEntity()).toList(),
  );
}

@freezed
class OptionModel with _$OptionModel {
  const factory OptionModel({
    required String id,
    String? content,
    @Default(false) bool isCorrect,
    @Default(1) int points,
    @Default(0) int orderIndex,
    String? questionId,
  }) = _OptionModel;

  const OptionModel._();

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  // ✅ IMPLEMENTACIÓN CORRECTA de toJson() para OptionModel
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (content != null) 'content': content,
      'isCorrect': isCorrect,
      'points': points,
      'orderIndex': orderIndex,
      if (questionId != null) 'questionId': questionId,
    };
  }

  Option toEntity() => Option(
    id: id,
    content: content ?? '',
    isCorrect: isCorrect,
    points: points,
    orderIndex: orderIndex,
    questionId: questionId ?? '',
  );
}