import 'package:dunamis/features/dashboard/data/model/dashboard_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_course_dto.g.dart';

@JsonSerializable()
class GetAllCourseDTO {
  final bool success;
  final int count;
  final List<CourseApiModel> data;

  GetAllCourseDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllCourseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllCourseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCourseDTOToJson(this);
}
