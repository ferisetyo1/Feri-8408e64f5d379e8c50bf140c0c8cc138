// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customrespon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customrespon _$CustomresponFromJson(Map<String, dynamic> json) {
  return Customrespon()
    ..status = json['status'] as num
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CustomresponToJson(Customrespon instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data
    };
