import 'package:flutter/material.dart';
import 'dart:async';
import 'package:untitled/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for dynamic height and width
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF2A4B6B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with dynamic width
            Image.asset(
              'assets/logo.png',
              width: screenWidth * 0.5, // Adjust logo width based on screen size
            ),
            SizedBox(height: screenHeight * 0.2), // Dynamic space after the logo
            // Text with dynamic size and styling
            const Text(
              'Powered by MediaFoundation',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.0,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Small gap
            const Text(
              'Version #.#.#',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.0,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
