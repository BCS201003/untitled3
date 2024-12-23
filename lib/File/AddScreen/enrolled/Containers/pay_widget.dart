import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/Dashboard/TeacherDashboard/teacherdashboard.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});

  @override
  _PayWidgetState createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
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
        const Padding(
          padding: EdgeInsets.only(left: 32.0, right: 32.0),
          child: Divider(color: Color(0xFFDDDDDD)),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Charges:',
              style: TextStyle(
                color: Color(0xFF2A4B6B),
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14, // Line height adjusted for font size
              ),
            ),
            Text(
              'PKR 1800.00',
              style: TextStyle(
                color: Color(0xFF2A4B6B),
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 31.78 / 14, // Line height adjusted for font size
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2A4B6B), // Background color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
            child: const Text(
              'Pay',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
