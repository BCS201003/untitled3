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
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExpandableContainer(
                controller: controller,
                media: 'Media Mind',
                icon: Icons.expand_more,
                expandedContent: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseCard(),
                    CourseCard(),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ExpandableContainer(
                controller: controller,
                media: 'AI Media',
                icon: Icons.expand_more,
                expandedContent: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseCard(),
                    CourseCard2(),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButton(
                context,
                label: 'Refresh',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyCourseDashboard()),
                  );
                },
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButton(
                context,
                label: 'Next',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, {
        required String label,
        required VoidCallback onPressed,
        required double screenWidth,
        required double screenHeight,
      }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2A4B6B),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
