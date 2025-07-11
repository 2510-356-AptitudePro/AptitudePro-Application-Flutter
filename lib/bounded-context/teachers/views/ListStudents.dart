import 'package:aptitude_pro_app/core/constants/app_colors.dart';

import '../../teachers/bloc/student_bloc.dart';
import '../../teachers/bloc/student_event.dart';
import '../../teachers/bloc/student_state.dart';
import '../../teachers/model/db/Db.dart';
import '../../teachers/views/CreateStudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Liststudents extends StatelessWidget {
  const Liststudents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StudentBloc(Db())..add(LoadStudents()),
      child: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            if (state is StudentLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Registro de Estudiantes'),
                  backgroundColor: AppColors.primary,
                ),
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is StudentLoaded) {
              final students = state.students;

              return Scaffold(
                appBar: AppBar(
                  title: Text('Registro de Estudiantes'),
                  backgroundColor: AppColors.primaryContainer,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<StudentBloc>(),
                          child: Createstudent(),
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: AppColors.secondaryContainer,
                ),
                body: students.isEmpty
                    ? Center(child: Text('No ha registrado estudiantes aún'))
                    : ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return Dismissible(
                      key: ValueKey(student.id),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.delete_forever),
                      ),
                      onDismissed: (direction) {
                        context
                            .read<StudentBloc>()
                            .add(DeleteStudent(student.id));
                      },

                      child: Container(
                        width: 350, // ajusta el ancho a tu gusto
                        margin: EdgeInsets.all(10), // separación del Card respecto a los bordes
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.primaryContainer,
                                    child: Icon(
                                      Icons.person_2_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // espacio bajo el icono
                                Text("Código: ${student.id}"),
                                Text("Usuario: ${student.userName}"),
                                Text("Nombre: ${student.firstName}"),
                                Text("Correo: ${student.email}"),
                                Text("Rol: ${student.role}"),
                                Text("Nacimiento: ${student.dateOfBirth}"),
                                Text("Teléfono: ${student.phone}"),
                                Text("Escuela: ${student.school}"),
                                Text("Grado: ${student.grade}"),
                                Text("Bio: ${student.bio}"),
                              ],
                            ),
                          ),
                        ),
                      ),

                    );
                  },
                ),
              );
            } else if (state is StudentError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Registro de Estudiantes'),
                  backgroundColor: AppColors.primaryContainer,
                ),
                body: Center(child: Text(state.message)),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Registro de Estudiantes'),
                  backgroundColor: AppColors.primaryContainer,
                ),
                body: Center(child: Text("Esperando registro de Estudiantes")),
              );
            }
          },
      ),
    );
  }
}
