import 'package:flutter/material.dart';
import 'package:dunamis/models/course.dart';

enum CourseCardVariant { normal, large }

class CourseCard extends StatelessWidget {
  final Course course;
  final CourseCardVariant variant;

  const CourseCard(
      {Key? key, required this.course, this.variant = CourseCardVariant.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLarge = variant == CourseCardVariant.large;
    return Card(
      elevation: 2,
      child: Row(
        children: [
          // Image.network(
          //   course.imageUrl,
          //   width: isLarge ? 100 : 60,
          //   height: isLarge ? 100 : 60,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(course.category,
                    style: Theme.of(context).textTheme.bodySmall),
                Row(
                  children: [
                    Text('${course.rating} ★'),
                    const SizedBox(width: 8.0),
                    Text('${course.reviews} reviews'),
                  ],
                ),
                Text(course.price == 0 ? 'Free' : 'Nrs. ${course.price}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
