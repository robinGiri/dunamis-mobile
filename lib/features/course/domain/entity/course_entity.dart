import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? courseId;
  final String? author;
  final String? description;
  final String courseName;

  const CourseEntity({
    this.courseId,
    this.author,
    this.description,
    required this.courseName,
  });

  @override
  List<Object?> get props => [courseId, courseName, description, author];
}
