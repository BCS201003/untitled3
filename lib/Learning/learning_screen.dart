import 'package:flutter/material.dart';
import 'package:untitled/Learning/Widget/courceprogress.dart';
import 'package:untitled/Learning/Widget/orc.dart';
import 'package:untitled/Learning/Widget/outcome.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Part-I Media Foundation & Civic Learning',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
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
    );
  }
}