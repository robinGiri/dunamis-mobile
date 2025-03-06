// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeApiModel _$MeApiModelFromJson(Map<String, dynamic> json) => MeApiModel(
      id: json['_id'] as String?,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      image: json['image'] as String?,
      phone: json['phone'] as String,
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$MeApiModelToJson(MeApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'image': instance.image,
      'phone': instance.phone,
      'courses': instance.courses,
      'username': instance.username,
      'password': instance.password,
    };
