import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Mycources/Controller/mycource_controller.dart';
import 'package:untitled/Mycources/Widgets/course_list_widget.dart';
import 'package:untitled/Mycources/Widgets/my_course_dashboard.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final TextEditingController _courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'MY COURSES',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),  // Adjust padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _courseController,
              decoration: InputDecoration(
                labelText: 'Add a New Course',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),  // Adjust spacing based on screen height
            ElevatedButton(
              onPressed: () {
                final courseName = _courseController.text.trim();
                if (courseName.isNotEmpty) {
                  Get.find<MyCourseController>().addCourse(courseName);
                  _courseController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Course name cannot be empty')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,  // Adjust vertical padding based on height
                  horizontal: screenWidth * 0.2,    // Adjust horizontal padding based on width
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
                ),
              ),
              child: const Text('Add Course'),
            ),
            SizedBox(height: screenHeight * 0.03),  // Adjust spacing between elements
            const Expanded(
              child: SingleChildScrollView(
                child: CourseListWidget(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),  // Adjust spacing
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A4B6B),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,  // Adjust vertical padding
                  horizontal: screenWidth * 0.2,   // Adjust horizontal padding
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyCourseDashboard(),
                  ),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
