part of 'course_bloc.dart';

class CourseState extends Equatable {
  final bool isLoading;
  final List<CourseListEntity> courses;
  final String error;

  const CourseState({
    required this.isLoading,
    required this.courses,
    required this.error,
  });

  factory CourseState.initial() {
    return CourseState(
      isLoading: false,
      courses: [],
      error: '',
    );
  }

  CourseState copyWith({
    bool? isLoading,
    List<CourseListEntity>? courses,
    String? error,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, courses, error];
}
