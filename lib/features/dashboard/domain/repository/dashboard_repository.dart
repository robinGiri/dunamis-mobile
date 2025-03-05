import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';

abstract interface class ICourseRepository {
  Future<Either<Failure, List<CourseListEntity>>> getCoursesList();
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
  Future<Either<Failure, List<UsersEntity>>> getUsers();
}
