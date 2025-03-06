import 'package:dunamis/features/account/domain/entity/me_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:dunamis/app/constants/hive_table_constant.dart';
import 'package:dunamis/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

part 'my_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class MeHiveModel extends Equatable {
  @HiveField(0)
  final String? studentId;
  @HiveField(1)
  final String fName;
  @HiveField(2)
  final String lName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String phone;
  @HiveField(6)
  final List<CourseHiveModel> courses;
  @HiveField(7)
  final String username;
  @HiveField(8)
  final String password;

  MeHiveModel({
    String? studentId,
    required this.fName,
    required this.lName,
    this.image,
    required this.phone,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // Initial Constructor
  const MeHiveModel.initial()
      : studentId = '',
        fName = '',
        lName = '',
        image = '',
        phone = '',
        courses = const [],
        username = '',
        password = '';

  // From Entity
  factory MeHiveModel.fromEntity(MeEntity entity) {
    return MeHiveModel(
      studentId: entity.userId,
      fName: entity.fName,
      lName: entity.lName,
      image: entity.image,
      phone: entity.phone,
      courses: CourseHiveModel.fromEntityList(entity.courses),
      username: entity.username,
      password: entity.password,
    );
  }

  // To Entity
  MeEntity toEntity() {
    return MeEntity(
      userId: studentId,
      fName: fName,
      lName: lName,
      image: image,
      phone: phone,
      courses: CourseHiveModel.toEntityList(courses),
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props =>
      [studentId, fName, lName, image, courses, username, password];
}
