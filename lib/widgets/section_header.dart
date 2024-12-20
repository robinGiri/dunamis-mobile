import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String seeAllLink;

  const SectionHeader({Key? key, required this.title, required this.seeAllLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, seeAllLink);
          },
          child: Text(
            "See All",
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
