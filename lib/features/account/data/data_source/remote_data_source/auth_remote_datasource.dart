import 'package:dio/dio.dart';
import 'package:dunamis/app/constants/api_endpoints.dart';
import 'package:dunamis/features/account/data/data_source/my_data_source.dart';
import 'package:dunamis/features/account/domain/entity/me_entity.dart';

class MeRemoteDataSource implements IMeDataSource {
  final Dio _dio;

  MeRemoteDataSource(this._dio);

  @override
  Future<MeEntity> getCurrentUser() async {
    try {
      Response response = await _dio.get(
        ApiEndpoints.register,
      );

      if (response.statusCode == 200) {
        return response.data;
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
