import 'package:dunamis/features/account/domain/entity/me_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dunamis/features/course/data/model/course_api_model.dart';

part 'my_api_model.g.dart';

@JsonSerializable()
class MeApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final List<CourseApiModel> courses;
  final String username;
  final String? password;

  const MeApiModel({
    this.id,
    required this.fname,
    required this.lname,
    required this.image,
    required this.phone,
    required this.courses,
    required this.username,
    required this.password,
  });

  factory MeApiModel.fromJson(Map<String, dynamic> json) =>
      _$MeApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeApiModelToJson(this);

  // To Entity
  MeEntity toEntity() {
    return MeEntity(
      userId: id,
      fName: fname,
      lName: lname,
      image: image,
      phone: phone,
      courses: courses.map((e) => e.toEntity()).toList(),
      username: username,
      password: password ?? '',
    );
  }

  // From Entity
  factory MeApiModel.fromEntity(MeEntity entity) {
    return MeApiModel(
      fname: entity.fName,
      lname: entity.lName,
      image: entity.image,
      phone: entity.phone,
      courses: entity.courses.map((e) => CourseApiModel.fromEntity(e)).toList(),
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props =>
      [id, fname, lname, image, phone, courses, username, password];
}
