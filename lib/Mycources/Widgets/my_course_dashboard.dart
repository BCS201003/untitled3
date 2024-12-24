import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Dashboard/dashboard.dart';
import 'package:untitled/Mycources/Controller/mycource_controller.dart';
import 'package:untitled/Mycources/Widgets/CourceCard/cource_card.dart';
import 'package:untitled/Mycources/Widgets/CourceCard/cource_card2.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/Widgets/Expend/expend_container.dart';

class MyCourseDashboard extends StatelessWidget {
  final MyCourseController controller = Get.put(MyCourseController());

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
                controller: controller, // Pass controller here
                media: 'Media Mind',   // Pass media title here
                icon: Icons.expand_more,
                expandedContent: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseCard(),
                    CourseCard(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ExpandableContainer(
                controller: controller, // Pass controller here
                media: 'AI Media',    // Pass media title here
                icon: Icons.expand_more,
                expandedContent: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseCard(),
                    CourseCard2(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(
                context,
                label: 'Refresh',
                onPressed: () {
                  // Reload current page without recursion
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyCourseDashboard()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildButton(
                context,
                label: 'Next',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2A4B6B),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
