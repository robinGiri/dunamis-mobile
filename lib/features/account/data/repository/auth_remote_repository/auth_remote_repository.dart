import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/account/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:dunamis/features/account/domain/entity/me_entity.dart';
import 'package:dunamis/features/account/domain/repository/auth_repository.dart';

class MeRemoteRepository implements IMeRepository {
  final MeRemoteDataSource _meRemoteDataSource;

  MeRemoteRepository(this._meRemoteDataSource);

  @override
  Future<Either<Failure, MeEntity>> getCurrentUser() async {
    try {
      final token = await _meRemoteDataSource.getCurrentUser();
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
