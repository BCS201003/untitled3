import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/Learning/Widget/orc_widget/contactview_widget/PointWidget1/client_message.dart';
import 'package:untitled/File/AddScreen/Learning/Widget/orc_widget/contactview_widget/PointWidget1/rating/rating.dart';
import 'package:untitled/File/AddScreen/Learning/Widget/orc_widget/contactview_widget/PointWidget1/rating/ratingbox.dart';

class Case1Widget extends StatelessWidget {
  const Case1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'What You Will Learn:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF042763),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(
                Icons.ac_unit,
                size: 18,
                color: Color(0xFF45C881),
              ),
              SizedBox(width: 5),
              Text(
                'Creative Safeguards & Media',
                textAlign: TextAlign.left, // Optional: Adjust alignment
                style: TextStyle(
                  fontFamily: 'Jost',
                  // Font family
                  fontSize: 9,
                  // Font size
                  fontWeight: FontWeight.w400,
                  // Font weight (400 = normal)
                  height: 12.33 / 9,
                  // Line height as a multiplier of font size
                  letterSpacing: -0.01,
                  // Adjust letter spacing
                  color: Color(0xFF75788D), // Text color
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Students will delve into the fundamentals of digital technology and media platforms, exploring\n'
                'topics such as ethical online behaviour, cyberbullying, identity, privacy, and digital health and\n'
                'wellness. This part lays the groundwork for understanding the dynamics of digital interactions\n'
                'and fostering responsible citizenship.',
            textAlign: TextAlign.justify,
            // Align text to justify
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 9,
              fontWeight: FontWeight.w400,
              height: 12.33 / 9,
              // Line height
              letterSpacing: -0.01,
              color: Color(0xFF75788D),
            ),
            softWrap: true,
            // Ensures the text wraps to the next line
            maxLines: null,
            // No limit on the number of lines
            overflow: TextOverflow
                .visible, // Allows text to overflow if required
          ),
          const SizedBox(height: 5),
          Container(
            width: 360, // Set a fixed width for the container (divider)
            height: 1, // Set a fixed height (this makes the divider visible)
            color: Colors.grey[300], // Divider color
          ),
          const SizedBox(height: 10),
          const RatingWidget(),
          const SizedBox(height: 10),
          const Message(),
        ],
      ),
    );
  }
}
