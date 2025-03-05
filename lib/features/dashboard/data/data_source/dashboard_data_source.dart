import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';

abstract interface class ICourseDataSourceList {
  Future<List<CourseListEntity>> getCoursesList();
  Future<List<CategoryEntity>> getCategory();
  Future<List<UsersEntity>> getUsers();
}
