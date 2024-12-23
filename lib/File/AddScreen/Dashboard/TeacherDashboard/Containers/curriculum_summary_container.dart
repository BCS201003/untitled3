import 'package:flutter/material.dart';

class CurriculumSummaryContainer extends StatelessWidget {
  const CurriculumSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: const Text(
            'Curriculum Summary',
            style: TextStyle(
              color: Color(0xFF042763),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            ListTile(
              title: const Text(
                'Class Progress',
                style: TextStyle(
                  color: Color(0xFF2A4B6B),
                  fontWeight: FontWeight.bold,
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
                  Image.asset('assets/MaskGroupFile.png', width: 20, height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
