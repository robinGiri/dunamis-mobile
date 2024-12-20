import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String seeAllLink;

  const SectionHeader({Key? key, required this.title, required this.seeAllLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, seeAllLink);
          },
          child: Text('See All', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
