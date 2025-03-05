import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';

abstract interface class ICourseRepository {
  Future<Either<Failure, List<CourseListEntity>>> getCoursesList();
}
