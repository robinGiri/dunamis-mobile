import 'package:dartz/dartz.dart';
import 'package:dunamis/app/usecase/usecase.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';
import 'package:dunamis/features/dashboard/domain/repository/dashboard_repository.dart';

class ListUsersUsecase implements UsecaseWithoutParams<List<UsersEntity>> {
  final ICourseRepository _courseRepository;

  ListUsersUsecase({required ICourseRepository courseRepository})
      : _courseRepository = courseRepository;

  @override
  Future<Either<Failure, List<UsersEntity>>> call() {
    return _courseRepository.getUsers();
  }
}
