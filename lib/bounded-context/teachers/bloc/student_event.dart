import '../../teachers/model/beans/Student.dart';

abstract class StudentEvent {}

class LoadStudents extends StudentEvent {}

class AddStudent extends StudentEvent {
  final Student student;

  AddStudent(this.student);
}

class DeleteStudent extends StudentEvent {
  final int studentId;

  DeleteStudent(this.studentId);
}