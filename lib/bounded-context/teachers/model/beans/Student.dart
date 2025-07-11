class Student{
  int id;
  String userName;
  String email;
  String role;
  String firstName;
  String dateOfBirth;
  String phone;
  String school;
  int grade;
  String bio;

  Student({
    required this.id,
    required this.userName,
    required this.email,
    required this.role,
    required this.firstName,
    required this.dateOfBirth,
    required this.phone,
    required this.school,
    required this.grade,
    required this.bio,
  });

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'userName': userName,
      'email': email,
      'role': role,
      'firstName': firstName,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'school': school,
      'grade': grade,
      'bio': bio

    };
  }

  Student.fromMap(Map<String, dynamic> res):
        id=res["id"],
        userName=res["userName"],
        email=res["email"],
        role=res["role"],
        firstName=res["firstName"],
        dateOfBirth=res["dateOfBirth"],
        phone=res["phone"],
        school=res["school"],
        grade=res["grade"],
        bio=res["bio"];
}