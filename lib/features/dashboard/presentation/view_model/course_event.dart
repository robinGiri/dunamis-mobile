part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class CourseLoad extends CourseEvent {}

class ListCategory extends CourseEvent {}

class ListUsers extends CourseEvent {}
