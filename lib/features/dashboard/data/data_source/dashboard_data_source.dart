import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';

abstract interface class ICourseDataSourceList {
  Future<List<CourseListEntity>> getCoursesList();
}
