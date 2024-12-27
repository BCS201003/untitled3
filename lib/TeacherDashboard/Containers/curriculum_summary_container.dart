import 'package:flutter/material.dart';

class CurriculumSummaryContainer extends StatelessWidget {
  const CurriculumSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9, // 90% of screen width for responsiveness
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Horizontal padding based on screen width
          title: Text(
            'Curriculum Summary',
            style: TextStyle(
              color: const Color(0xFF042763),
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05, // Font size based on screen width
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            ListTile(
              title: Text(
                'Class Progress',
                style: TextStyle(
                  color: const Color(0xFF2A4B6B),
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045, // Font size based on screen width
                ),
              ),
              subtitle: const Text('50%'),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                  Image.asset('assets/MaskGroupFile.png', width: screenWidth * 0.08, height: screenWidth * 0.08), // Image size based on screen width
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
