import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/account/data/data_source/local_data_source/my_local_datasource.dart';
import 'package:dunamis/features/account/domain/entity/me_entity.dart';
import 'package:dunamis/features/account/domain/repository/auth_repository.dart';

class MyLocalRepository implements IMeRepository {
  final MeLocalDataSource _myLocalDataSource;

  MyLocalRepository(this._myLocalDataSource);

  @override
  Future<Either<Failure, MeEntity>> getCurrentUser() async {
    try {
      final currentUser = await _myLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
