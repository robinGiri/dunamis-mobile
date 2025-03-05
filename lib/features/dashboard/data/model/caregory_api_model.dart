import 'package:dunamis/features/dashboard/domain/entity/category_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'caregory_api_model.g.dart';

@JsonSerializable()
class CategoryApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String name;

  const CategoryApiModel({
    required this.name,
  });

  factory CategoryApiModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryApiModelToJson(this);

  // To entity

// From Entity
  factory CategoryApiModel.fromEntity(CategoryEntity entity) {
    return CategoryApiModel(
      name: entity.name,
    );
  }

  // To Entity
  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
    );
  }

  // To Entity List
  static List<CategoryEntity> toEntityList(List<CategoryApiModel> entityList) {
    return entityList.map((data) => data.toEntity()).toList();
  }

  // From entity list
  static List<CategoryApiModel> fromEntityList(
      List<CategoryEntity> entityList) {
    return entityList
        .map((entity) => CategoryApiModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
