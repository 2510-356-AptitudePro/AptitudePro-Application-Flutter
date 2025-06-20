import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/test_model.dart';
import '../../results/models/test_result_model.dart';
import '../services/test_service.dart';
import '../entities/test.dart';
import '../../results/entities/test_result.dart';

// Test List Provider
final testListProvider = FutureProvider.autoDispose<List<Test>>((ref) async {
  print('🔍 testListProvider: Obteniendo tests...');

  final service = ref.watch(testServiceProvider);
  final response = await service.getTests(); // ✅ Ahora devuelve PaginatedResponse

  print('✅ testListProvider: ${response.data.length} tests obtenidos');
  print('✅ testListProvider: Total: ${response.total}, Página: ${response.page}');

  return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
});

// Test by Type Provider
final testsByTypeProvider = FutureProvider.family.autoDispose<List<Test>, TestType>(
      (ref, type) async {
    print('🔍 testsByTypeProvider: Obteniendo tests tipo ${type.value}...');

    final service = ref.watch(testServiceProvider);
    final response = await service.getTestsByType(type.value); // ✅ Ahora devuelve PaginatedResponse

    print('✅ testsByTypeProvider: ${response.data.length} tests obtenidos');

    return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
  },
);

// Single Test Provider
final testProvider = FutureProvider.family.autoDispose<Test, String>(
      (ref, testId) async {
    final service = ref.watch(testServiceProvider);
    final model = await service.getTestById(testId);
    return model.toEntity();
  },
);

// Test for Taking Provider
final testForTakingProvider = FutureProvider.family.autoDispose<Test, String>(
      (ref, testId) async {
    final service = ref.watch(testServiceProvider);
    final model = await service.getTestForTaking(testId);
    return model.toEntity();
  },
);

// Test Results Provider
final myTestResultsProvider = FutureProvider.autoDispose<List<TestResult>>((ref) async {
  print('🔍 myTestResultsProvider: Obteniendo resultados...');

  final service = ref.watch(testServiceProvider);
  final response = await service.getMyResults(); // ✅ Ahora devuelve PaginatedResponse

  print('✅ myTestResultsProvider: ${response.data.length} resultados obtenidos');

  return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
});

// Single Test Result Provider
final testResultProvider = FutureProvider.family.autoDispose<TestResult, String>(
      (ref, resultId) async {
    final service = ref.watch(testServiceProvider);
    final model = await service.getResultById(resultId);
    return model.toEntity();
  },
);

// Test Taking State Provider (sin cambios)
final testTakingProvider = StateNotifierProvider.autoDispose
    .family<TestTakingNotifier, TestTakingState, String>((ref, testId) {
  return TestTakingNotifier(
    ref.watch(testServiceProvider),
    testId,
  );
});

class TestTakingState {
  final String testId;
  final int currentQuestionIndex;
  final Map<String, String> answers; // questionId -> optionId
  final DateTime startTime;
  final bool isSubmitting;
  final TestResult? result;
  final String? error;

  TestTakingState({
    required this.testId,
    this.currentQuestionIndex = 0,
    this.answers = const {},
    DateTime? startTime,
    this.isSubmitting = false,
    this.result,
    this.error,
  }) : startTime = startTime ?? DateTime.now();

  TestTakingState copyWith({
    int? currentQuestionIndex,
    Map<String, String>? answers,
    bool? isSubmitting,
    TestResult? result,
    String? error,
  }) {
    return TestTakingState(
      testId: testId,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      answers: answers ?? this.answers,
      startTime: startTime,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

  int get timeSpentSeconds => DateTime.now().difference(startTime).inSeconds;
}

class TestTakingNotifier extends StateNotifier<TestTakingState> {
  final TestService _testService;

  TestTakingNotifier(this._testService, String testId)
      : super(TestTakingState(testId: testId));

  void answerQuestion(String questionId, String optionId) {
    final newAnswers = Map<String, String>.from(state.answers);
    newAnswers[questionId] = optionId;
    state = state.copyWith(answers: newAnswers);
  }

  void nextQuestion() {
    state = state.copyWith(
      currentQuestionIndex: state.currentQuestionIndex + 1,
    );
  }

  void previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
      );
    }
  }

  void goToQuestion(int index) {
    state = state.copyWith(currentQuestionIndex: index);
  }

  Future<void> submitTest() async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final answers = state.answers.entries.map((entry) {
        return SubmitAnswerModel(
          questionId: entry.key,
          selectedOptionId: entry.value,
        );
      }).toList();

      final request = SubmitTestRequestModel(
        testId: state.testId,
        answers: answers,
        timeSpent: state.timeSpentSeconds,
      );

      final resultModel = await _testService.submitTest(request);
      final result = resultModel.toEntity();

      state = state.copyWith(
        isSubmitting: false,
        result: result,
      );
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: e.toString(),
      );
    }
  }
}