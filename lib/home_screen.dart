import 'package:flutter/material.dart';
import 'package:untitled/signin/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A4B6B),
      floatingActionButton: SizedBox(
        width: 50,
        child: SizedBox(
          height: 60,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              backgroundColor: const Color(0xFF2A4B6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_upward, size: 30),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/logo_institute.png'),
          const SizedBox(height: 80),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome to our Learning Hub!',
                  style: TextStyle(
                    color: Color(0xFF2A4B6B),
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Welcome to our LMS app, a community of learners where knowledge meets innovation. '
                        'Get ready to explore, learn, and grow with our comprehensive platform designed to support your educational journey.',
                    style: TextStyle(
                      color: Color(0xFF75788D),
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, bottom: 16.0),
                  child: Text(
                    'Ready to begin?',
                    style: TextStyle(
                      color: Color(0xFF75788D),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
