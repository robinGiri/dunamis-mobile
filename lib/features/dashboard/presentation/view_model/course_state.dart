part of 'course_bloc.dart';

class CourseState extends Equatable {
  final bool isLoading;
  final List<CourseListEntity> courses;
  final List<CategoryEntity> categories;
  final List<UsersEntity> users;
  final String error;

  const CourseState({
    required this.isLoading,
    required this.courses,
    required this.categories,
    required this.users,
    required this.error,
  });

  factory CourseState.initial() {
    return CourseState(
      isLoading: false,
      courses: [],
      categories: [],
      users: [],
      error: '',
    );
  }

  CourseState copyWith({
    bool? isLoading,
    List<CourseListEntity>? courses,
    List<CategoryEntity>? categories,
    List<UsersEntity>? users,
    String? error,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
      categories: categories ?? this.categories,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [isLoading, courses, categories, users, error];
}
