import '../../results/models/test_result_model.dart';

abstract class ResultEvent {}

class LoadResult extends ResultEvent{}

class AddResult extends ResultEvent{
    final Result result;
    
    AddResult(this.result);
}

class DeleteResult extends ResultEvent{
    final int resultId;

    DeleteResult(this.resultId);
}