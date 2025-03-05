part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class CourseLoad extends CourseEvent {}

class ListCategory extends CourseEvent {
  @override
  List<Object> get props => [];
}

class ListUsers extends CourseEvent {
  @override
  List<Object> get props => [];
}
