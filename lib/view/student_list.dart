
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_provider/controller/core/constants.dart';
import 'package:student_provider/provider/list_provider.dart';
import 'package:student_provider/view/add_students.dart';
import 'package:student_provider/view/student_details.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryclr,
        title: !homeProvider.isSearching
            ? const Text('Student List', style: titletxt)
            : TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  homeProvider.filterStudents(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Search student here',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              homeProvider.toggleSearch();
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: homeProvider.filteredStudents.isEmpty
          ? const Center(
              child: Text(
                'No students found.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                    wordSpacing: 5),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 8.0,
              //   mainAxisSpacing: 8.0,
              // ),
              itemCount: homeProvider.filteredStudents.length,
              itemBuilder: (context, index) {
                final student = homeProvider.filteredStudents[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailspage(student: student),
                      ),
                    ).then((value) => homeProvider.refreshStudentList());
                  },
                
                  child: Card(
                    
                    shadowColor: Colors.black,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                            const SizedBox(
                              width: 20,
                            ),

                           CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              FileImage(File(student.profilePicturePath)),
                        ),
                        const SizedBox(width: 20,),
                         Text(
                          
                          student.name,
                          style: const TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              overflow: TextOverflow.fade),
                        ),
                        const Spacer(),
                        //  IconButton(
                        //       icon: const Icon(Icons.delete),
                        //       onPressed: () {
                        //          showDialog(
                        //           context: context,
                        //           builder: (context) => DeleteDialog(
                        //             onCancel: () {
                        //               Navigator.pop(context);
                        //             },
                        //             onDelete: () {
                        //               Provider.of<StudentDetailProvider>(
                        //                       context,
                        //                       listen: false)
                        //                   .deleteStudent(student.id);
                                         
                        //               void popUntilHomeScreen(
                        //                   BuildContext context) {
                        //                 Navigator.popUntil(
                        //                     context, (route) => route.isFirst);
                        //               }
                        //               popUntilHomeScreen(context);
                                    
                        //             },
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //     IconButton(
                        //       icon: const Icon(Icons.edit),
                        //       onPressed: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) =>
                        //                 EditStudentScreen(student: student),
                        //           ),
                        //         ).then((_) => Navigator.pop(context));
                        //       },
                        //     ),
                        ],
                      )
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddStudentScreen()))
              .then((value) => homeProvider.refreshStudentList());
        },
        backgroundColor: primaryclr,
        child: const Icon(Icons.add),
      ),
    );
  }
  
  
}
