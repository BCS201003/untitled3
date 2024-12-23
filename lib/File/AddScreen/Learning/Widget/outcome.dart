import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/Learning/Widget/video.dart';

class LearnWidget extends StatelessWidget {
  const LearnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '4 Components ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 12,
                      fontWeight: FontWeight.bold, // Correct assignment
                      color: Color(0xFF042763),
                      height: 17.0 / 12.0, // Correct height calculation
                    ),
                  ),
                Text(
                  '55 Secs ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 12,
                    fontWeight: FontWeight.bold, // Correct assignment
                    color: Color(0xFF042763),
                    height: 17.0 / 12.0, // Correct height calculation
                  ),
                  ),
            Text(
              'Video Duration: 1 Min 52 Sec',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                fontWeight: FontWeight.bold, // Correct assignment
                color: Color(0xFF042763),
                height: 17.0 / 12.0, // Correct height calculation
              ),
            ),
              ],
              ),
            ),
          SizedBox(height: 10),
          //VideoDisplayWidget(),
        ],
      ),
    );
  }
}
