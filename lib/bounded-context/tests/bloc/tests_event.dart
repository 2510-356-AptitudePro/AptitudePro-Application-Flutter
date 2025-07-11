import '../../tests/models/test_model.dart';

abstract class TestEvent {}

class LoadTests extends TestEvent{}

class AddTest extends TestEvent{
    final Test test;
    
    AddTest(this.test);
}

class DeleteTest extends TestEvent{
    final int testId;

    DeleteTest(this.testId);
}