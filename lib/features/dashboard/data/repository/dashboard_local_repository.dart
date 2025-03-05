// import 'package:dartz/dartz.dart';
// import 'package:dunamis/core/error/failure.dart';
// import 'package:dunamis/features/dashboard/data/data_source/local_datasource/dashboard_local_data_source.dart';
// import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
// import 'package:dunamis/features/dashboard/domain/repository/dashboard_repository.dart';

// class CourseLocalRepository implements ICourseRepository {
//   final CourseLocalDataSource _courseLocalDataSource;

//   CourseLocalRepository({required CourseLocalDataSource courseLocalDataSource})
//       : _courseLocalDataSource = courseLocalDataSource;

//   @override
//   Future<Either<Failure, List<CourseListEntity>>> getCoursesList() {
//     try {
//       return _courseLocalDataSource.getCourses().then(
//         (value) {
//           return Right(value);
//         },
//       );
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }
// }
