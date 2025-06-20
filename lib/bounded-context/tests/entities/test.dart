import 'package:equatable/equatable.dart';

class Test extends Equatable {
  final String id;
  final String title;
  final String description;
  final TestType type;
  final int duration; // en minutos
  final bool isActive;
  final String? instructions;
  final String? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Question> questions;
  final int questionCount;

  const Test({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.duration,
    required this.isActive,
    this.instructions,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.questions = const [],
    this.questionCount = 0,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    type,
    duration,
    isActive,
    instructions,
    createdBy,
    createdAt,
    updatedAt,
    questions,
    questionCount,
  ];
}

class Question extends Equatable {
  final String id;
  final String content;
  final String? imageUrl;
  final int orderIndex;
  final String? category;
  final int points;
  final String testId;
  final List<Option> options;

  const Question({
    required this.id,
    required this.content,
    this.imageUrl,
    required this.orderIndex,
    this.category,
    required this.points,
    required this.testId,
    required this.options,
  });

  @override
  List<Object?> get props => [
    id,
    content,
    imageUrl,
    orderIndex,
    category,
    points,
    testId,
    options,
  ];
}

class Option extends Equatable {
  final String id;
  final String content;
  final bool isCorrect;
  final int points;
  final int orderIndex;
  final String questionId;

  const Option({
    required this.id,
    required this.content,
    required this.isCorrect,
    required this.points,
    required this.orderIndex,
    required this.questionId,
  });

  @override
  List<Object?> get props => [
    id,
    content,
    isCorrect,
    points,
    orderIndex,
    questionId,
  ];
}

enum TestType {
  aptitude('aptitude'),
  personality('personality'),
  intelligence('intelligence'),
  vocational('vocational');

  final String value;
  const TestType(this.value);

  static TestType fromString(String value) {
    return TestType.values.firstWhere(
          (type) => type.value == value,
      orElse: () => TestType.aptitude,
    );
  }

  String get displayName {
    switch (this) {
      case TestType.aptitude:
        return 'Aptitud';
      case TestType.personality:
        return 'Personalidad';
      case TestType.intelligence:
        return 'Inteligencia';
      case TestType.vocational:
        return 'Vocacional';
    }
  }

  String get description {
    switch (this) {
      case TestType.aptitude:
        return 'Evalúa tus habilidades y competencias en diferentes áreas';
      case TestType.personality:
        return 'Descubre tus rasgos de personalidad y cómo influyen en tu carrera';
      case TestType.intelligence:
        return 'Mide tu capacidad cognitiva y potencial intelectual';
      case TestType.vocational:
        return 'Identifica tus intereses y orientación profesional';
    }
  }
}