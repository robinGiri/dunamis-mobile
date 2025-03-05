import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_api_model.g.dart';

@JsonSerializable()
class CourseApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? courseId;
  final String? price;
  final String courseName;

  const CourseApiModel({
    this.courseId,
    this.price,
    required this.courseName,
  });

  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  // To entity

// From Entity
  factory CourseApiModel.fromEntity(CourseListEntity entity) {
    return CourseApiModel(
      courseId: entity.courseId,
      price: entity.price,
      courseName: entity.courseName,
    );
  }

  // To Entity
  CourseListEntity toEntity() {
    return CourseListEntity(
      courseId: courseId,
      price: price,
      courseName: courseName,
    );
  }

  // To Entity List
  static List<CourseListEntity> toEntityList(List<CourseApiModel> entityList) {
    return entityList.map((data) => data.toEntity()).toList();
  }

  // From entity list
  static List<CourseApiModel> fromEntityList(
      List<CourseListEntity> entityList) {
    return entityList
        .map((entity) => CourseApiModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
