import 'package:dunamis/features/dashboard/domain/entity/users_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String username;
  final String role;

  const UserApiModel({
    required this.username,
    required this.role,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // To entity

// From Entity
  factory UserApiModel.fromEntity(UsersEntity entity) {
    return UserApiModel(
      username: entity.username,
      role: entity.role,
    );
  }

  // To Entity
  UsersEntity toEntity() {
    return UsersEntity(
      username: username,
      role: role,
    );
  }

  // To Entity List
  static List<UsersEntity> toEntityList(List<UserApiModel> entityList) {
    return entityList.map((data) => data.toEntity()).toList();
  }

  // From entity list
  static List<UserApiModel> fromEntityList(List<UsersEntity> entityList) {
    return entityList.map((entity) => UserApiModel.fromEntity(entity)).toList();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
