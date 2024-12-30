import 'package:flutter/material.dart';
import 'package:untitled/TeacherDashboard/teacherdashboard.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});

  @override
  PayWidgetState createState() => PayWidgetState();
}

class PayWidgetState extends State<PayWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // You can adjust the border radius based on screenWidth or screenHeight
    double borderRadius = screenWidth * 0.05; // or use screenHeight * 0.05

    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              checkColor: Colors.white,
              activeColor: const Color(0xFF2A4B6B),
            ),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  text: 'Please check to acknowledge our ',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF75788D),
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy & Terms Policy',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2A4B6B),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08,
          ),
          child: const Divider(color: Color(0xFFDDDDDD)),
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Charges:',
              style: TextStyle(
                color: const Color(0xFF2A4B6B),
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14,
              ),
            ),
            Text(
              'PKR 1800.00',
              style: TextStyle(
                color: const Color(0xFF2A4B6B),
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.03),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2A4B6B),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.2,
                vertical: screenHeight * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeacherDashboard(),
                ),
              );
            },
            child: Text(
              'Pay',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
