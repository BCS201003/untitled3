import 'package:flutter/material.dart';

class SelectClassContainer extends StatelessWidget {
  const SelectClassContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9, // Adjust width to 90% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Adjust padding based on screen width
          title: Text(
            'Select Class',
            style: TextStyle(
              color: const Color(0xFF042763),
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05, // Adjust font size based on screen width
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            ListTile(
              title: Text(
                'Class 6th',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Adjust font size based on screen width
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Class 7th',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Adjust font size based on screen width
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Class 9th',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Adjust font size based on screen width
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
