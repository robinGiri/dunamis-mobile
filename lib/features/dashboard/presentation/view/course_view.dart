import 'package:dunamis/features/dashboard/presentation/view_model/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final courseNameController = TextEditingController();

  final _dashboardViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _dashboardViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<DashboardCourseBloc, CourseState>(
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
                            subtitle: Text(course.price!),
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
