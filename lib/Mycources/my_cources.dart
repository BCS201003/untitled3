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
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MY COURSES',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _courseController,
              decoration: InputDecoration(
                labelText: 'Add a New Course',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
              child: const Text('Add Course'),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                child: CourseListWidget(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A4B6B),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
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