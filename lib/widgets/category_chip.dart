import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  const CategoryChip({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(category),
      backgroundColor: Colors.grey[200],
    );
  }
}
