// import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:dunamis/app/constants/hive_table_constant.dart';
// import 'package:dunamis/features/course/domain/entity/course_entity.dart';
// import 'package:uuid/uuid.dart';

// part 'course_hive_model.g.dart';

// @HiveType(typeId: HiveTableConstant.courseTableId)
// class DashboardCourseHiveModel extends Equatable {
//   @HiveField(0)
//   final String? courseId;

//   @HiveField(1)
//   final String courseName;

//   DashboardCourseHiveModel({
//     String? courseId,
//     required this.courseName,
//   }) : courseId = courseId ?? const Uuid().v4();

//   // Initial Constructor
//   const DashboardCourseHiveModel.initial()
//       : courseId = '',
//         courseName = '';

//   // From Entity
//   factory DashboardCourseHiveModel.fromEntity(CourseListEntity entity) {
//     return DashboardCourseHiveModel(
//       courseId: entity.courseId,
//       courseName: entity.courseName,
//     );
//   }

//   // To Entity
//   CourseListEntity toEntity() {
//     return CourseListEntity(
//       courseId: courseId,
//       courseName: courseName,
//     );
//   }

//   // To Entity List
//   static List<CourseListEntity> toEntityList(
//       List<DashboardCourseHiveModel> entityList) {
//     return entityList.map((data) => data.toEntity()).toList();
//   }

//   // From entity list
//   static List<DashboardCourseHiveModel> fromEntityList(
//       List<CourseListEntity> entityList) {
//     return entityList
//         .map((entity) => DashboardCourseHiveModel.fromEntity(entity))
//         .toList();
//   }

//   @override
//   List<Object?> get props => [courseId, courseName];
// }
