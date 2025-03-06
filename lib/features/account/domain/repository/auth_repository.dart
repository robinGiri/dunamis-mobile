import 'package:dartz/dartz.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/account/domain/entity/me_entity.dart';

abstract interface class IMeRepository {
  Future<Either<Failure, MeEntity>> getCurrentUser();
}
