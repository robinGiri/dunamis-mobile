import 'package:dunamis/features/dashboard/data/model/caregory_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_caregory_dto.g.dart';

@JsonSerializable()
class GetAllCategoryDTO {
  final bool success;
  final int count;
  final List<CategoryApiModel> data;

  GetAllCategoryDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllCategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoryDTOToJson(this);
}
