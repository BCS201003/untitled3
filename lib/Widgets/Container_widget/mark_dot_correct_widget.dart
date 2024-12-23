import 'package:flutter/material.dart';

class MarkDotCorrect extends StatelessWidget {
  const MarkDotCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2A4B6B),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Is your name correct?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'true',
                    style: TextStyle(
                      color: Color(0xFF2A4B6B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'false',
                    style: TextStyle(
                      color: Color(0xFF2A4B6B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}