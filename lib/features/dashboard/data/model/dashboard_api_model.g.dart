// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseApiModel _$CourseApiModelFromJson(Map<String, dynamic> json) =>
    CourseApiModel(
      courseId: json['_id'] as String?,
      price: json['price'] as String?,
      courseName: json['courseName'] as String,
    );

Map<String, dynamic> _$CourseApiModelToJson(CourseApiModel instance) =>
    <String, dynamic>{
      '_id': instance.courseId,
      'price': instance.price,
      'courseName': instance.courseName,
    };
