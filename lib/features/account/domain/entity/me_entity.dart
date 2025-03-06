import 'package:equatable/equatable.dart';
import 'package:dunamis/features/course/domain/entity/course_entity.dart';

class MeEntity extends Equatable {
  final String? userId;
  final String fName;
  final String lName;
  final String? image;
  final String phone;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const MeEntity({
    this.userId,
    required this.fName,
    required this.lName,
    this.image,
    required this.phone,
    required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, fName, lName, image, phone, courses, username, password];
}
