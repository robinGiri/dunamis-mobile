part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String fName;
  final String lName;
  final String phone;
  final List<CourseEntity> courses;
  final String username;
  final String password;
  final String? image;

  const RegisterStudent({
    required this.context,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.courses,
    required this.username,
    required this.password,
    this.image,
  });
}
