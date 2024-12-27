import 'package:flutter/material.dart';
import 'package:untitled/Learning/Widget/courceprogress.dart';
import 'package:untitled/Learning/Widget/orc.dart';
import 'package:untitled/Learning/Widget/outcome.dart';
import 'package:untitled/Quiz/quiz.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Part-I Media Foundation & Civic Learning',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.04), // Add some padding based on screen size
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LearnWidget(),
                CourseProgress(),
                ORC(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.1), // Adjust floating button position from bottom
        child: FloatingActionButton(
          onPressed: () {
            // Navigate to QuizScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );
          },
          backgroundColor: Colors.blue,
          elevation: 5.0,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
