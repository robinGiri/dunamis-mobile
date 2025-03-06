import 'package:dunamis/features/account/domain/entity/me_entity.dart';

abstract interface class IMeDataSource {
  Future<MeEntity> getCurrentUser();
}
