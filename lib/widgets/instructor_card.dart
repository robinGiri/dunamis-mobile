import 'package:flutter/material.dart';
import 'package:dunamis/models/instructor.dart';

class InstructorCard extends StatelessWidget {
  final Instructor instructor;

  const InstructorCard({Key? key, required this.instructor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(instructor.imageUrl)),
      title: Text(instructor.name),
      subtitle: Text(instructor.role),
      trailing: Text('${instructor.rating} ★'),
    );
  }
}
