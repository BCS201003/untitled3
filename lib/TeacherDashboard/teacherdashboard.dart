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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Teacher Dashboard',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButton: SizedBox(
        width: screenWidth * 0.12,
        height: screenHeight * 0.07,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Learning()),
              );
            },
            child: const Icon(Icons.login),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),

            Text(
              'Teacher Info',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF042763),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SelectClassContainer(),
                  SizedBox(height: screenHeight * 0.02),

                  const StudentListContainer(),
                  SizedBox(height: screenHeight * 0.02),

                  const TeacherListContainer(),
                  SizedBox(height: screenHeight * 0.02),

                  const CurriculumSummaryContainer(),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
