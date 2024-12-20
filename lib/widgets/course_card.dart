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
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            course.imageUrl,
            height: isLarge ? 160 : 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        course.category,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orangeAccent, size: 16),
                          const SizedBox(width: 4),
                          Text('${course.rating}'),
                          const SizedBox(width: 8),
                          Text('(${course.reviews})',
                              style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    course.title,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.price == 0 ? 'Free' : 'Nrs. ${course.price}',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (isLarge)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            textStyle: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          onPressed: () {},
                          child: Text(
                              course.price == 0 ? 'Enroll' : 'Try for Free'),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
