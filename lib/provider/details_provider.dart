import 'package:flutter/material.dart';
import 'package:student_provider/controller/db/database.dart';

class StudentDetailProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();

  Future<void> deleteStudent(int studentId) async {
    await db.deleteStudent(studentId);
  }
}
