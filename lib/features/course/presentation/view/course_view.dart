import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dunamis/features/course/presentation/view_model/course_bloc.dart';

class CourseView extends StatelessWidget {
  CourseView({super.key});

  final courseNameController = TextEditingController();

  final _courseViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _courseViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state.courses.isEmpty) {
                    return Center(child: Text('No Courses Added Yet'));
                  } else if (state.isLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          final course = state.courses[index];
                          return ListTile(
                            title: Text(course.courseName),
                            subtitle: Text(course.description ??
                                'No description available'),
                            leading: IconButton(
                              icon: CircleAvatar(
                                child: Text(course.author ?? 'Robin'),
                              ),
                              onPressed: () {
                                context.read<CourseBloc>().add(
                                      ViewCourse(id: course.courseId!),
                                    );
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.view_agenda),
                              onPressed: () {
                                context.read<CourseBloc>().add(
                                      ViewCourse(id: course.courseId!),
                                    );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
