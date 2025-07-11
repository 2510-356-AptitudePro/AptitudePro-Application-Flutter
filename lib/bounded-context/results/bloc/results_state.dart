import '../../results/models/test_result_model.dart';

abstract class ResultState {}

class ResultInitial extends ResultState {}

class ResultLoading extends ResultState {}

class ResultLoaded extends ResultState {
    final List<Result> result;

    ResultLoaded(this.result);
}

class ResultError extends ResultState {
    final String message;

    ResultError(this.message);
}