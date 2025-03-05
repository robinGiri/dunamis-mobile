import 'package:dartz/dartz.dart';
import 'package:dunamis/app/usecase/usecase.dart';
import 'package:dunamis/core/error/failure.dart';
import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:dunamis/features/dashboard/domain/repository/dashboard_repository.dart';

class LoadCategoryUsecase
    implements UsecaseWithoutParams<List<CategoryEntity>> {
  final ICourseRepository _courseRepository;

  LoadCategoryUsecase({required ICourseRepository courseRepository})
      : _courseRepository = courseRepository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() {
    return _courseRepository.getCategory();
  }
}
