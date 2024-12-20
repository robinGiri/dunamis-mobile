// screens/home/instructors_section.dart
import 'package:flutter/material.dart';
import 'package:dunamis/models/instructor.dart';
import 'package:dunamis/widgets/section_header.dart';
import 'package:dunamis/widgets/instructor_card.dart';

class InstructorsSection extends StatelessWidget {
  final List<Instructor> instructors;

  const InstructorsSection({Key? key, required this.instructors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Instructors', seeAllLink: '/instructors'),
        const SizedBox(height: 8.0),
        Column(
          children:
              instructors.map((i) => InstructorCard(instructor: i)).toList(),
        ),
      ],
    );
  }
}
