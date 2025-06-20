import 'package:equatable/equatable.dart';
import '../../tests/entities/test.dart';

class TestResult extends Equatable {
  final String id;
  final String userId;
  final String testId;
  final TestScores? scores;
  final AptitudeProfile? aptitudeProfile;
  final List<CareerRecommendation> careerRecommendations;
  final int timeSpent;
  final bool isCompleted;
  final DateTime completedAt;
  final Test? test;
  final List<Answer> answers;

  const TestResult({
    required this.id,
    required this.userId,
    required this.testId,
    this.scores,
    this.aptitudeProfile,
    this.careerRecommendations = const [],
    required this.timeSpent,
    required this.isCompleted,
    required this.completedAt,
    this.test,
    this.answers = const [],
  });

  int get totalScore => scores?.total ?? 0;
  int get answersCount => answers.length;

  @override
  List<Object?> get props => [
    id,
    userId,
    testId,
    scores,
    aptitudeProfile,
    careerRecommendations,
    timeSpent,
    isCompleted,
    completedAt,
    test,
    answers,
  ];

  List<CareerRecommendation> get recommendations => careerRecommendations;
}

class TestScores extends Equatable {
  final int? verbal;
  final int? numerical;
  final int? spatial;
  final int? logical;
  final int? total;
  // ✅ NUEVO: Campos adicionales dinámicos
  final Map<String, dynamic> additionalScores;

  const TestScores({
    this.verbal,
    this.numerical,
    this.spatial,
    this.logical,
    this.total,
    this.additionalScores = const {},
  });

  factory TestScores.fromMap(Map<String, dynamic> map) {
    // Campos conocidos
    final knownFields = {'verbal', 'numerical', 'spatial', 'logical', 'total'};

    // Separar campos conocidos de adicionales
    final additional = Map<String, dynamic>.from(map);
    additional.removeWhere((key, value) => knownFields.contains(key));

    return TestScores(
      verbal: map['verbal']?.toInt(),
      numerical: map['numerical']?.toInt(),
      spatial: map['spatial']?.toInt(),
      logical: map['logical']?.toInt(),
      total: map['total']?.toInt(),
      additionalScores: additional,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      ...additionalScores, // Primero los adicionales
    };

    // Luego los campos específicos (sobrescriben si existe conflicto)
    if (verbal != null) result['verbal'] = verbal;
    if (numerical != null) result['numerical'] = numerical;
    if (spatial != null) result['spatial'] = spatial;
    if (logical != null) result['logical'] = logical;
    if (total != null) result['total'] = total;

    return result;
  }

  // ✅ NUEVO: Getter para acceder a cualquier score por nombre
  int? getScore(String scoreName) {
    switch (scoreName.toLowerCase()) {
      case 'verbal':
        return verbal;
      case 'numerical':
        return numerical;
      case 'spatial':
        return spatial;
      case 'logical':
        return logical;
      case 'total':
        return total;
      default:
        return additionalScores[scoreName]?.toInt();
    }
  }

  // ✅ NUEVO: Obtener todos los scores como lista
  List<MapEntry<String, int>> get allScores {
    final scores = <MapEntry<String, int>>[];

    if (verbal != null) scores.add(MapEntry('Verbal', verbal!));
    if (numerical != null) scores.add(MapEntry('Numérico', numerical!));
    if (spatial != null) scores.add(MapEntry('Espacial', spatial!));
    if (logical != null) scores.add(MapEntry('Lógico', logical!));

    // Agregar scores adicionales
    additionalScores.forEach((key, value) {
      if (value is num) {
        scores.add(MapEntry(key, value.toInt()));
      }
    });

    return scores;
  }

  @override
  List<Object?> get props => [
    verbal,
    numerical,
    spatial,
    logical,
    total,
    additionalScores
  ];
}

class AptitudeProfile extends Equatable {
  final List<String> strengths;
  final List<String> weaknesses;
  final String primaryAptitude;

  const AptitudeProfile({
    required this.strengths,
    required this.weaknesses,
    required this.primaryAptitude,
  });

  factory AptitudeProfile.fromMap(Map<String, dynamic> map) {
    return AptitudeProfile(
      strengths: List<String>.from(map['strengths'] ?? []),
      weaknesses: List<String>.from(map['weaknesses'] ?? []),
      primaryAptitude: map['primaryAptitude'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strengths': strengths,
      'weaknesses': weaknesses,
      'primaryAptitude': primaryAptitude,
    };
  }

  @override
  List<Object?> get props => [strengths, weaknesses, primaryAptitude];

  // ✅ CORRECCIÓN: Implementar correctamente el getter
  List<String> get areasForImprovement => weaknesses;
}

class Answer extends Equatable {
  final String id;
  final String testResultId;
  final String questionId;
  final String? selectedOptionId;
  final String? textAnswer;
  final int pointsEarned;
  final bool isCorrect;

  const Answer({
    required this.id,
    required this.testResultId,
    required this.questionId,
    this.selectedOptionId,
    this.textAnswer,
    required this.pointsEarned,
    required this.isCorrect,
  });

  @override
  List<Object?> get props => [
    id,
    testResultId,
    questionId,
    selectedOptionId,
    textAnswer,
    pointsEarned,
    isCorrect,
  ];
}

class CareerRecommendation extends Equatable {
  final String careerId;
  final String careerName;
  final double matchPercentage;
  final String reasoning;

  const CareerRecommendation({
    required this.careerId,
    required this.careerName,
    required this.matchPercentage,
    required this.reasoning,
  });

  @override
  List<Object?> get props => [careerId, careerName, matchPercentage, reasoning];

  double get compatibilityScore => matchPercentage;
  String get title => careerName;
  String get reason => reasoning;
}