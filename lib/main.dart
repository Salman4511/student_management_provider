import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:student_provider/provider/add_provider.dart';
import 'package:student_provider/provider/details_provider.dart';
import 'package:student_provider/provider/edit_provider.dart';
import 'package:student_provider/provider/list_provider.dart';
import 'package:student_provider/provider/splash_provider.dart';
import 'package:student_provider/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentDetailProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AddStudentProvider()),
        ChangeNotifierProvider(create: (_) => EditStudentProvider())
        // Add other providers here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My students',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
