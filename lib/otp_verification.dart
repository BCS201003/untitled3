import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Padding_weight/otp_output.dart';
import 'dart:async';

import 'package:untitled/create_password.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  OtpVerificationState createState() => OtpVerificationState();
}

class OtpVerificationState extends State<OtpVerification> {
  bool _isOtpComplete = false;
  String _timerText = '1:30';
  late Timer _timer;
  int _remainingSeconds = 90;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          int minutes = _remainingSeconds ~/ 60;
          int seconds = _remainingSeconds % 60;
          _timerText = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _checkOtpCompletion(List<TextEditingController> controllers) {
    setState(() {
      _isOtpComplete = controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.07), // Use 7% padding based on screen width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.02), // Use 2% of screen height for spacing
            Center(
              child: Image.asset(
                'assets/logo2.png',
                height: screenHeight * 0.25, // 25% of screen height for the image
              ),
            ),
            SizedBox(height: screenHeight * 0.015), // Spacing between elements
            Text(
              'Enter OTP',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.08, // Font size relative to screen width
                fontWeight: FontWeight.w600,
                height: 40 / 28,
                color: const Color(0xFF2A4B6B),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: screenHeight * 0.01), // Spacing between elements
            const Text.rich(
              TextSpan(
                text: 'Enter OTP sent to ',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '+92 321 5761275',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A4B6B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Spacing between elements
            OtpInputFields(onOtpChanged: _checkOtpCompletion),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Font size relative to screen width
                    color: Colors.grey,
                  ),
                ),
                Text(
                  _timerText,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Font size relative to screen width
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05), // Spacing between elements
            ElevatedButton(
              onPressed: _isOtpComplete
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePasswordScreen(),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isOtpComplete ? const Color(0xFF2A4B6B) : Colors.grey,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // 2% vertical padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Verify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05, // Font size relative to screen width
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Spacing between elements
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(
                    text: 'Wrong Number? ',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035, // Font size relative to screen width
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Change Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2A4B6B),
                          decoration: TextDecoration.underline,
                          fontSize: screenWidth * 0.035, // Font size relative to screen width
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
