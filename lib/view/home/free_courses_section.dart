// screens/home/free_courses_section.dart
import 'package:flutter/material.dart';
import 'package:dunamis/models/course.dart';
import 'package:dunamis/widgets/section_header.dart';
import 'package:dunamis/widgets/course_card.dart';

class FreeCoursesSection extends StatelessWidget {
  final List<Course> courses;

  const FreeCoursesSection({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Free courses', seeAllLink: '/free-courses'),
        const SizedBox(height: 8.0),
        Column(
          children: courses.map((c) => CourseCard(course: c)).toList(),
        ),
      ],
    );
  }
}
