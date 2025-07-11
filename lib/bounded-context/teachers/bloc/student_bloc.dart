import '../../teachers/bloc/student_event.dart';
import '../../teachers/bloc/student_state.dart';
import '../../teachers/model/beans/Student.dart';
import '../../teachers/model/db/Db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StudentBloc extends Bloc<StudentEvent, StudentState>{
  final Db db;

  StudentBloc(this.db): super(StudentInitial()){
    on<LoadStudents>((event, emit) async {
      emit(StudentLoading());
      try{
        final students = await db.listAll();
        emit(StudentLoaded(students));
      }catch (e){
        emit(StudentError("Error al cargar estudiantes"));
      }
    });

    on<AddStudent>((event, emit) async{
      await db.insertStudent(event.student);
      final students = await db.listAll();
      emit(StudentLoaded(students));
    });

    on<DeleteStudent>((event, emit) async {
      final database = await db.initializeDB();
      await database.delete(
        'students',
        where: 'id = ?',
        whereArgs: [event.studentId],
      );
      final students = await db.listAll();
      emit(StudentLoaded(students));
    });
  }
}