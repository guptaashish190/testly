// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      username: json['username'] as String? ?? "",
      email: json['email'] as String? ?? "",
      profilePicture: json['profile_picture'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
      'user_id': instance.userId,
      'phone_number': instance.phoneNumber,
    };
