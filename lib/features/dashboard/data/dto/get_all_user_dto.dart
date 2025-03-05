import 'package:dunamis/features/dashboard/data/model/user_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_user_dto.g.dart';

@JsonSerializable()
class GetAllUsersDTO {
  final bool success;
  final int count;
  final List<UserApiModel> data;

  GetAllUsersDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllUsersDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUsersDTOToJson(this);
}
