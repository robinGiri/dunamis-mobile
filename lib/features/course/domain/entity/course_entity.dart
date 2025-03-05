import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? courseId;
  final String? price;
  final String courseName;

  const CourseEntity({
    this.courseId,
    this.price,
    required this.courseName,
  });

  @override
  List<Object?> get props => [courseId, courseName];
}
