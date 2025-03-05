import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/dashboard/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';
import 'package:dunamis/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardCourseRemoteRepository implements ICourseRepository {
  final DashboardRemoteDataSource _courseRemoteDataSource;

  DashboardCourseRemoteRepository(this._courseRemoteDataSource);

  @override
  Future<Either<Failure, List<CourseListEntity>>> getCoursesList() async {
    try {
      final courses = await _courseRemoteDataSource.getCoursesList();
      return Right(courses);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategory() async {
    try {
      final category = await _courseRemoteDataSource.getCategory();
      return Right(category);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() async {
    try {
      final users = await _courseRemoteDataSource.getUsers();
      return Right(users);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
