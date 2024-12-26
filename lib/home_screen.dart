import 'package:flutter/material.dart';
import 'package:untitled/signin/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for dynamic height and width
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF2A4B6B),
      floatingActionButton: SizedBox(
        width: screenWidth * 0.13, // Floating button width responsive
        child: SizedBox(
          height: screenHeight * 0.07, // Floating button height responsive
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
      body: SingleChildScrollView(  // Add this to make the entire body scrollable
        child: Column(
          children: [
            // Logo with dynamic width
            Image.asset(
              'assets/logo_institute.png',
              width: screenWidth * 0.5, // Adjust logo width based on screen size
            ),
            SizedBox(height: screenHeight * 0.1), // Dynamic space after the logo

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.12), // Dynamic top-left radius
                  topRight: Radius.circular(screenWidth * 0.12), // Dynamic top-right radius
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.02), // Dynamic spacing

                  // Welcome Text with Dynamic font size
                  Text(
                    'Welcome to our Learning Hub!',
                    style: TextStyle(
                      color: const Color(0xFF2A4B6B),
                      fontFamily: 'Poppins',
                      fontSize: screenWidth * 0.06, // Responsive font size
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02), // Dynamic spacing

                  // Welcome Description Text with Dynamic font size
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Dynamic padding
                    child: Text(
                      'Welcome to our LMS app, a community of learners where knowledge meets innovation. '
                          'Get ready to explore, learn, and grow with our comprehensive platform designed to support your educational journey.',
                      style: TextStyle(
                        color: const Color(0xFF75788D),
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Dynamic space

                  // Ready to begin? Text with Dynamic font size
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1, bottom: screenHeight * 0.02), // Dynamic padding
                    child: Text(
                      'Ready to begin?',
                      style: TextStyle(
                        color: const Color(0xFF75788D),
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Dynamic space

                  // Optional Spacer widget for more flexibility
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
