// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..username = json['username'] as String
    ..password = json['password'] as String
    ..login_time = json['login_time'] as String
    ..login_state = json['login_state'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'login_time': instance.login_time,
      'login_state': instance.login_state
    };
