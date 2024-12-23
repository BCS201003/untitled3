import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/Quiz/Quiz_widget/lesson/lesson.dart';
import 'package:untitled/File/AddScreen/Quiz/Quiz_widget/lesson/lesson2.dart';
import 'package:untitled/File/AddScreen/Quiz/Quiz_widget/msqsresultwidget.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'MY COURSES',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MCQsResultWidget(),
              Question1Widget(),
              Question2Widget(),
            ],
          ),
        ),
      ),
    );
  }
}