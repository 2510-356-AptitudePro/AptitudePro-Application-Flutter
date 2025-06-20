import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    required String email,
    required String role,
    required bool isActive,

    // ✅ CAMPOS OPCIONALES
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phone,
    String? school,
    int? grade,
    String? bio,
    String? profilePicture,

    // ✅ CAMPOS CON VALORES POR DEFECTO
    @Default(false) bool emailVerified,

    // ✅ FECHAS OPCIONALES (el servidor no las envía en login)
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  get profileImage => null;

  get isPsychologist => null;

  User toEntity() => User(
    id: id,
    username: username,
    email: email,
    role: UserRole.fromString(role),
    firstName: firstName,
    lastName: lastName,
    dateOfBirth: dateOfBirth,
    phone: phone,
    school: school,
    grade: grade,
    bio: bio,
    profilePicture: profilePicture,
    isActive: isActive,
    emailVerified: emailVerified,
    createdAt: createdAt ?? DateTime.now(), // ✅ Valor por defecto si es null
    updatedAt: updatedAt ?? DateTime.now(), // ✅ Valor por defecto si es null
  );
}

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required UserModel user,
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@freezed
class SignInRequestModel with _$SignInRequestModel {
  const factory SignInRequestModel({
    required String identifier,
    required String password,
  }) = _SignInRequestModel;

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);
}

@freezed
class SignUpRequestModel with _$SignUpRequestModel {
  const factory SignUpRequestModel({
    required String username,
    required String email,
    required String password,
    String? role,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phone,
    String? school,
    int? grade,
    String? bio,
  }) = _SignUpRequestModel;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}

@freezed
class UpdateProfileRequestModel with _$UpdateProfileRequestModel {
  const factory UpdateProfileRequestModel({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phone,
    String? school,
    int? grade,
    String? bio,
  }) = _UpdateProfileRequestModel;

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);
}

@freezed
class ChangePasswordRequestModel with _$ChangePasswordRequestModel {
  const factory ChangePasswordRequestModel({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePasswordRequestModel;

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestModelFromJson(json);
}