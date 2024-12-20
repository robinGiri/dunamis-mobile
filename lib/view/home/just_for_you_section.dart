// screens/home/just_for_you_section.dart
import 'package:flutter/material.dart';
import 'package:dunamis/models/course.dart';
import 'package:dunamis/widgets/section_header.dart';
import 'package:dunamis/widgets/course_card.dart';

class JustForYouSection extends StatelessWidget {
  final List<Course> courses;

  const JustForYouSection({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Just for you', seeAllLink: '/just-for-you'),
        const SizedBox(height: 8.0),
        // You can customize the layout as needed (GridView, Carousel, etc.)
        Column(
          children: courses
              .map((c) =>
                  CourseCard(course: c, variant: CourseCardVariant.large))
              .toList(),
        ),
      ],
    );
  }
}
