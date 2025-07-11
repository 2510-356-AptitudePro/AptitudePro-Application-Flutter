import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../teachers/model/beans/Student.dart';

class Db{

  Future<Database> initializeDB() async{
    String path=await getDatabasesPath();
    return openDatabase(
      join(path,'dbStudents.db'),
      onCreate: (database,version) async{
        await database.execute(
            'CREATE TABLE students(id INTEGER PRIMARY KEY, userName TEXT, email TEXT, role TEXT, firstName TEXT, dateOfBirth TEXT, phone TEXT, school TEXT, grade INTEGER, bio TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertStudent(Student stu) async{
    final db=await initializeDB();
    await db.insert('students', stu.toMap());
  }

  Future<List<Student>> listAll() async{
    final db=await initializeDB();
    final List<Map<String, dynamic>> query=await db.query('students');
    return query.map((e)=>Student.fromMap(e)).toList();
  }

}