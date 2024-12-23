import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:untitled/Widgets/Padding_weight/otp_output.dart';
import 'dart:async';

import 'package:untitled/create_password.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            Center(
              child: Image.asset(
                'assets/logo2.png',
                height: 250,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter OTP',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 40 / 28,
                color: Color(0xFF2A4B6B),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
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
            const SizedBox(height: 20),
            OtpInputFields(onOtpChanged: _checkOtpCompletion),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  _timerText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Wrong Number? ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Change Number',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2A4B6B),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
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

