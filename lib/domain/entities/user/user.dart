import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String email;
  final UserRole role;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? phone;
  final String? school;
  final int? grade;
  final String? bio;
  final String? profilePicture;
  final bool isActive;
  final bool emailVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phone,
    this.school,
    this.grade,
    this.bio,
    this.profilePicture,
    required this.isActive,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullName {
    if (firstName == null && lastName == null) return username;
    return '${firstName ?? ''} ${lastName ?? ''}'.trim();
  }

  String get initials {
    if (firstName != null && lastName != null) {
      return '${firstName![0]}${lastName![0]}'.toUpperCase();
    } else if (firstName != null) {
      return firstName!.substring(0, 2).toUpperCase();
    } else {
      return username.substring(0, 2).toUpperCase();
    }
  }

  bool get isStudent => role == UserRole.student;
  bool get isPsychologist => role == UserRole.psychologist;
  bool get isTeacher => role == UserRole.teacher;
  bool get isAdmin => role == UserRole.admin;

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    role,
    firstName,
    lastName,
    dateOfBirth,
    phone,
    school,
    grade,
    bio,
    profilePicture,
    isActive,
    emailVerified,
    createdAt,
    updatedAt,
  ];

  get profileImage => null;
}

enum UserRole {
  student('student'),
  psychologist('psychologist'),
  teacher('teacher'),
  admin('admin');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
          (role) => role.value == value,
      orElse: () => UserRole.student,
    );
  }

  String get displayName {
    switch (this) {
      case UserRole.student:
        return 'Estudiante';
      case UserRole.psychologist:
        return 'Psicólogo';
      case UserRole.teacher:
        return 'Profesor';
      case UserRole.admin:
        return 'Administrador';
    }
  }
}


