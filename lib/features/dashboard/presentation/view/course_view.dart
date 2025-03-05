import 'package:dunamis/features/dashboard/presentation/view_model/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  final courseNameController = TextEditingController();
  final _dashboardViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _dashboardViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Courses Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: BlocBuilder<DashboardCourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.courses.isEmpty) {
                      return const Center(child: Text('No Courses Added Yet'));
                    }
                    return ListView.builder(
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                        final course = state.courses[index];
                        return ListTile(
                          title: Text(course.courseName),
                          subtitle: Text(course.price ?? ''),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Categories Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: BlocBuilder<DashboardCourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.categories.isEmpty) {
                      return const Center(
                          child: Text('No Categories Added Yet'));
                    }
                    return ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return ListTile(
                          title: Text(category.name),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Users Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Users",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: BlocBuilder<DashboardCourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.users.isEmpty) {
                      return const Center(child: Text('No Users Added Yet'));
                    }
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return ListTile(
                          title: Text(user.username),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
