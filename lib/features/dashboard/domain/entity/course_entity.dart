import 'package:equatable/equatable.dart';

class CourseListEntity extends Equatable {
  final String? courseId;
  final String? price;
  final String? description;
  final String? type;
  final String? author;
  final String? category;
  final String courseName;

  const CourseListEntity({
    this.courseId,
    this.price,
    this.description,
    this.type,
    this.author,
    this.category,
    required this.courseName,
  });

  @override
  List<Object?> get props =>
      [courseId, courseName, price, description, type, author, category];
}
