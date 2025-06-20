// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      isActive: json['isActive'] as bool,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      school: json['school'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      profilePicture: json['profilePicture'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'isActive': instance.isActive,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phone': instance.phone,
      'school': instance.school,
      'grade': instance.grade,
      'bio': instance.bio,
      'profilePicture': instance.profilePicture,
      'emailVerified': instance.emailVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
    };

_$SignInRequestModelImpl _$$SignInRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignInRequestModelImpl(
      identifier: json['identifier'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$SignInRequestModelImplToJson(
        _$SignInRequestModelImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
    };

_$SignUpRequestModelImpl _$$SignUpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpRequestModelImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      school: json['school'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$SignUpRequestModelImplToJson(
        _$SignUpRequestModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phone': instance.phone,
      'school': instance.school,
      'grade': instance.grade,
      'bio': instance.bio,
    };

_$UpdateProfileRequestModelImpl _$$UpdateProfileRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfileRequestModelImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      school: json['school'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$UpdateProfileRequestModelImplToJson(
        _$UpdateProfileRequestModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'phone': instance.phone,
      'school': instance.school,
      'grade': instance.grade,
      'bio': instance.bio,
    };

_$ChangePasswordRequestModelImpl _$$ChangePasswordRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordRequestModelImpl(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$$ChangePasswordRequestModelImplToJson(
        _$ChangePasswordRequestModelImpl instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
