import 'package:dunamis/core/network/hive_service.dart';
import 'package:dunamis/features/account/data/data_source/my_data_source.dart';
import 'package:dunamis/features/account/domain/entity/me_entity.dart';

class MeLocalDataSource implements IMeDataSource {
  final HiveService _hiveService;

  MeLocalDataSource(this._hiveService);

  @override
  Future<MeEntity> getCurrentUser() {
    return Future.value(
      MeEntity(
        userId: "1",
        fName: "",
        lName: "",
        image: null,
        phone: "",
        courses: [],
        username: "",
        password: "",
      ),
    );
  }
}
