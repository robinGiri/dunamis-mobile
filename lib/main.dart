import 'package:flutter/material.dart';
import 'package:dunamis/core/app_theme/app_theme.dart';
import 'package:dunamis/view/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingPage(),
      },
    );
  }
}
