import 'package:dio/dio.dart';
import 'package:dunamis/app/constants/api_endpoints.dart';
import 'package:dunamis/features/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:dunamis/features/dashboard/data/dto/get_all_caregory_dto.dart';
import 'package:dunamis/features/dashboard/data/dto/get_all_course_dto.dart';
import 'package:dunamis/features/dashboard/data/dto/get_all_user_dto.dart';
import 'package:dunamis/features/dashboard/data/model/caregory_api_model.dart';
import 'package:dunamis/features/dashboard/data/model/dashboard_api_model.dart';
import 'package:dunamis/features/dashboard/data/model/user_api_model.dart';
import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';

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

  @override
  Future<List<CategoryEntity>> getCategory() async {
    try {
      var response = await _dio.get(ApiEndpoints.getCategory);
      if (response.statusCode == 200) {
        // Convert API response to DTO
        var courseDTO = GetAllCategoryDTO.fromJson(response.data);
        // Convert DTO to Entity
        return CategoryApiModel.toEntityList(courseDTO.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<UsersEntity>> getUsers() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllStudent);
      if (response.statusCode == 200) {
        // Convert API response to DTO
        var courseDTO = GetAllUsersDTO.fromJson(response.data);
        // Convert DTO to Entity
        return UserApiModel.toEntityList(courseDTO.data);
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
