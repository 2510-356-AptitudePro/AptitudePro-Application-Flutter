import 'package:aptitude_pro_app/core/constants/app_colors.dart';

import '../../teachers/bloc/student_bloc.dart';
import '../../teachers/bloc/student_event.dart';
import '../../teachers/model/beans/Student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Createstudent extends StatefulWidget {
  const Createstudent({super.key});

  @override
  State<Createstudent> createState() => _CreatestudentState();
}

class _CreatestudentState extends State<Createstudent> {
  final _formKey = GlobalKey<FormState>();
  int id = 0;
  String userName = "";
  String email = "";
  String role = "Estudent";
  String firstName = "";
  String dateOfBirth = "";
  String phone = "";
  String school = "";
  int grade = 0;
  String bio = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar un nuevo Estudiante',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Código"),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  id = int.tryParse(value ?? "") ?? 0;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre de Usuario"),
                onSaved: (value) => userName = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Correo Institucional"),
                onSaved: (value) => email = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Rol"),
                initialValue: "Estudiante",
                readOnly: true,
                onSaved: (value) => role = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nombres"),
                onSaved: (value) => firstName = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Fecha de Nacimiento (YYYY-MM-DD)"),
                onSaved: (value) => dateOfBirth = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Teléfono"),
                onSaved: (value) => phone = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Escuela"),
                onSaved: (value) => school = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Grado"),
                keyboardType: TextInputType.number,
                onSaved: (value) => grade = int.tryParse(value ?? "0") ?? 0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Biografía"),
                maxLines: 3,
                onSaved: (value) => bio = value ?? "",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  role = "Estudiante";

                  _formKey.currentState?.save();

                  Student newStudent = Student(
                    id: id,
                    userName: userName,
                    email: email,
                    role: role,
                    firstName: firstName,
                    dateOfBirth: dateOfBirth,
                    phone: phone,
                    school: school,
                    grade: grade,
                    bio: bio,
                  );

                  context.read<StudentBloc>().add(AddStudent(newStudent));
                  Navigator.pop(context);
                },
                child: Text("Registrar Estudiante"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
