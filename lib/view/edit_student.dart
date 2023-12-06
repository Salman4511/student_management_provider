import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:student_provider/controller/core/constants.dart';
import 'package:student_provider/controller/db/database.dart';
import 'package:student_provider/provider/edit_provider.dart';
import 'package:student_provider/view/widgets/save_button.dart';
import '../model/student_model.dart';

class EditStudentScreen extends StatelessWidget {
  final Student student;
  EditStudentScreen({required this.student});

  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _schoolnameController = TextEditingController();
  final _fathernameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final editStudentProvider = Provider.of<EditStudentProvider>(context);

    _nameController.text = student.name;
    _schoolnameController.text = student.schoolname;
    _fathernameController.text = student.fathername;
    _ageController.text = student.age.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Students", style: titletxt),
        backgroundColor: primaryclr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              kheight,
              GestureDetector(
                onTap: () async {
                  XFile? img = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  editStudentProvider.setImage(img);
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: editStudentProvider.profilePicturePath !=
                          null
                      ? FileImage(File(editStudentProvider.profilePicturePath!))
                      : FileImage(File(student.profilePicturePath)),
                ),
              ),
              kheight20,
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text('Student Name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Student Name';
                  } else {
                    return null;
                  }
                },
              ),
              kheight17,
              TextFormField(
                controller: _schoolnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text(' School Name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter The school Name';
                  } else {
                    return null;
                  }
                },
              ),
              kheight17,
              TextFormField(
                controller: _fathernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text('Father Name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Father Name';
                  } else {
                    return null;
                  }
                },
              ),
              kheight17,
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text('Age'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Age';
                  } else {
                    return null;
                  }
                },
              ),
              kheight40,
              Savebutton(onTap: () {
                if (_formkey.currentState!.validate()) {
                  final name = _nameController.text;
                  final schoolname = _schoolnameController.text;
                  final fathername = _fathernameController.text;
                  final age = int.parse(_ageController.text);

                  final updatedStudent = Student(
                    id: student.id,
                    name: name,
                    schoolname: schoolname,
                    fathername: fathername,
                    age: age,
                    profilePicturePath:
                        editStudentProvider.profilePicturePath ??
                            student.profilePicturePath,
                  );

                  DatabaseHelper datahelp = DatabaseHelper();
                  datahelp.updateStudent(updatedStudent).then((id) {
                    if (id > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Student updated successfully')),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Failed to update student')),
                      );
                    }
                  });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
