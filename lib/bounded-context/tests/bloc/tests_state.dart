import '../../tests/models/test_model.dart';

abstract class TestState {}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
    final List<Test> tests;

    TestLoaded(this.tests);
}

class TestError extends TestState {
    final String message;

    TestError(this.message);
}