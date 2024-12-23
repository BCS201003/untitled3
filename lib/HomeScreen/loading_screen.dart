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
    return Scaffold(
      backgroundColor: const Color(0xFF2A4B6B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo.png'),
          ),
          const SizedBox(height: 400),
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
          const SizedBox(height: 10),
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
    );
  }
}