import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/dashboard.dart';
import 'package:untitled/Mycources/Widgets/CourceCard/cource_card.dart';
import 'package:untitled/Mycources/Widgets/CourceCard/cource_card2.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/Widgets/Other_widget/expend_container.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class MyCourseDashboard extends StatelessWidget {
  final ProfileController controller = ProfileController();
  MyCourseDashboard({super.key});
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpandableContainer(
                controller: controller,
                media: 'Media Mind',
                icon: Icons.expand_more,
                expandedContent: const Row(
                  children: [
                    CourseCard(),
                    CourseCard(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ExpandableContainer(
                controller: controller,
                media: 'AI Media',
                icon: Icons.expand_more,
                expandedContent: const Row(
                  children: [
                    CourseCard(),
                    CourseCard2(),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A4B6B),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyCourseDashboard(),
                    ),
                  );
                },
                child: const Text(
                  'Refresh',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A4B6B),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
