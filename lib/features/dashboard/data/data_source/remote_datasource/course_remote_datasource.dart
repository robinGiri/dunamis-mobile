import 'package:dio/dio.dart';
import 'package:dunamis/app/constants/api_endpoints.dart';
import 'package:dunamis/features/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:dunamis/features/dashboard/data/dto/get_all_course_dto.dart';
import 'package:dunamis/features/dashboard/data/model/dashboard_api_model.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';

class DashboardRemoteDataSource implements ICourseDataSourceList {
  final Dio _dio;

  DashboardRemoteDataSource(this._dio);

  @override
  Future<List<CourseListEntity>> getCoursesList() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllCourse);
      if (response.statusCode == 200) {
        // Convert API response to DTO
        var courseDTO = GetAllCourseDTO.fromJson(response.data);
        // Convert DTO to Entity
        return CourseApiModel.toEntityList(courseDTO.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
