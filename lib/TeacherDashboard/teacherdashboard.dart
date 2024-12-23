import 'package:flutter/material.dart';
import 'package:untitled/Learning/learning_screen.dart';
import 'package:untitled/TeacherDashboard/Containers/curriculum_summary_container.dart';
import 'package:untitled/TeacherDashboard/Containers/select_class_container.dart';
import 'package:untitled/TeacherDashboard/Containers/student_list_container.dart';
import 'package:untitled/TeacherDashboard/Containers/teacher_list_container.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Teacher Dashboard',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButton: SizedBox(
        width: 50,
        child: SizedBox(
          height: 60,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Learning()),
                );
              },
              child: const Icon(Icons.login), // You might want to add an icon or text here.
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Teacher Info
            Text(
              'Teacher Info',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 24.48 / 24,
                textBaseline: TextBaseline.alphabetic,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Color(0xFF042763),
                color: Color(0xFF042763),
              ),
            ),

            SizedBox(height: 20),

            // Centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Select Class
                  SelectClassContainer(),
                  SizedBox(height: 20),

                  // Student List
                  StudentListContainer(),
                  SizedBox(height: 20),

                  // Teacher List
                  TeacherListContainer(),
                  SizedBox(height: 20),

                  // Curriculum Summary
                  CurriculumSummaryContainer(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
