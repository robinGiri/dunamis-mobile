import 'package:flutter/material.dart';
import 'package:dunamis/models/course.dart';
import 'package:dunamis/models/instructor.dart';
import 'package:dunamis/widgets/search_bar.dart' as custom;
import 'package:dunamis/view/home/categories_section.dart';
import 'package:dunamis/view/home/just_for_you_section.dart';
import 'package:dunamis/view/home/top_rated_section.dart';
import 'package:dunamis/view/home/instructors_section.dart';
import 'package:dunamis/view/home/free_courses_section.dart';
import 'package:dunamis/widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // These are mock data placeholders. In a real app, you’d fetch or
  // provide this data via a state management solution.
  List<String> get categories =>
      ['Faith', 'Righteousness', 'Love', 'Leadership', 'Business'];

  List<Course> get justForYouCourses => [
        Course(
          id: 'c1',
          title: 'Webflow Course',
          category: 'Development',
          price: 2500,
          rating: 5.0,
          reviews: 10,
          imageUrl: 'https://picsum.photos/id/237/200/300',
        ),
      ];

  List<Course> get topRatedCourses => [
        Course(
          id: 'c1',
          title: 'Pneumatology',
          category: 'Development',
          price: 2500,
          rating: 5.0,
          reviews: 18,
          imageUrl: 'https://picsum.photos/id/247/200/300',
        ),
        Course(
          id: 'c2',
          title: 'Hermeneutics',
          category: 'Programming',
          price: 2500,
          rating: 5.0,
          reviews: 16,
          imageUrl: 'https://picsum.photos/id/217/200/300',
        ),
        Course(
          id: 'c3',
          title: 'Pneumatology',
          category: 'Development',
          price: 2500,
          rating: 5.0,
          reviews: 18,
          imageUrl: 'https://picsum.photos/id/241/200/300',
        ),
        Course(
          id: 'c4',
          title: 'Hermeneutics',
          category: 'Programming',
          price: 2500,
          rating: 5.0,
          reviews: 16,
          imageUrl: 'https://picsum.photos/id/212/200/300',
        ),
      ];

  List<Instructor> get instructors => [
        Instructor(
          id: 'i1',
          name: 'Amrita Tamang',
          role: 'English Teacher',
          coursesCount: 6,
          rating: 5.0,
          followers: 12400,
          imageUrl: 'https://picsum.photos/id/327/200/300',
        ),
        Instructor(
          id: 'i2',
          name: 'Mukesh Tamang',
          role: 'Designer at Webflow',
          coursesCount: 6,
          rating: 5.0,
          followers: 12400,
          imageUrl: 'https://picsum.photos/id/247/200/300',
        ),
      ];

  List<Course> get freeCourses => [
        Course(
          id: 'c4',
          title: 'Homiletics',
          category: 'Design',
          price: 0,
          rating: 5.0,
          reviews: 26,
          imageUrl: 'https://picsum.photos/id/287/200/300',
        ),
        Course(
          id: 'c5',
          title: 'Environmental Theology',
          category: 'Design',
          price: 0,
          rating: 5.0,
          reviews: 18,
          imageUrl: 'https://picsum.photos/id/27/200/300',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const custom.SearchBar(),
              CategoriesSection(categories: categories),
              JustForYouSection(courses: justForYouCourses),
              TopRatedSection(courses: topRatedCourses),
              InstructorsSection(instructors: instructors),
              FreeCoursesSection(courses: freeCourses),
              const SizedBox(height: 10), // padding for bottom nav overlap
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 0,
        onItemTapped: (int value) {},
      ),
    );
  }
}
