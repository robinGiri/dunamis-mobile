part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class CourseLoad extends CourseEvent {}

class CreateCourse extends CourseEvent {
  final String courseName;

  const CreateCourse({required this.courseName});

  @override
  List<Object> get props => [courseName];
}

class ViewCourse extends CourseEvent {
  final String id;

  const ViewCourse({required this.id});

  @override
  List<Object> get props => [id];
}
