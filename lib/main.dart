import 'package:flutter/material.dart';
import 'package:task_manager/features/auth/pages/signup_page.dart'; // Importing the Flutter material package

void main() {
  runApp(const MyApp()); // Main function that starts the Flutter application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Default theme color
      ),
      home: const SignupPage(),
    );
  }
}
