// screens/home/categories_section.dart
import 'package:flutter/material.dart';
import 'package:dunamis/widgets/section_header.dart';
import 'package:dunamis/widgets/category_chip.dart';

class CategoriesSection extends StatelessWidget {
  final List<String> categories;

  const CategoriesSection({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Categories', seeAllLink: '/categories'),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              categories.map((cat) => CategoryChip(category: cat)).toList(),
        ),
      ],
    );
  }
}
