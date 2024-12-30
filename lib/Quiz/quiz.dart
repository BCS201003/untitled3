import 'package:flutter/material.dart';
import 'package:untitled/Quiz/Widget/msqsresultwidget.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/new_screen2.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ));
        },
        child: const Icon(Icons.home),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MCQsResultWidget(),
              // Ensure these widgets are defined or imported
              // Replace with your actual widget definitions
              Placeholder(fallbackHeight: 100), // Replace with Question1Widget()
              Placeholder(fallbackHeight: 100), // Replace with Question2Widget()
            ],
          ),
        ),
      ),
    );
  }
}
