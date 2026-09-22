import 'package:flutter/material.dart';
import 'package:student_hub/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Hub',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: LoginPage(),
    );
  }
}


