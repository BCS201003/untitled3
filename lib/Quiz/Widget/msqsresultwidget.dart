import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MCQsResultWidget extends StatefulWidget {
  const MCQsResultWidget({super.key});

  @override
  MCQsResultWidgetState createState() => MCQsResultWidgetState();
}

class MCQsResultWidgetState extends State<MCQsResultWidget> {
  bool _showFeedback = false; // Track whether feedback is visible

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const Text(
          'Result Details',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2A4B6B),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: const Color.fromARGB(255, 56, 120, 143),
              end: const Color.fromARGB(255, 56, 120, 143),
            ),
            duration: const Duration(seconds: 2),
            builder: (context, color, child) {
              return CircularPercentIndicator(
                radius: screenWidth * 0.245,
                lineWidth: screenWidth * 0.062,
                animation: true,
                percent: 0.6,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "60%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.08,
                        color: const Color(0xFF2A4B6B),
                      ),
                    ),
                    Text(
                      "Qualified",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Jost',
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: color,
                backgroundColor: Colors.grey.withOpacity(0.4),
              );
            },
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Result ',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showFeedback = !_showFeedback; // Toggle the feedback widget
            });
          },
          child: const Text("Mark"),
        ),
        // Feedback widget
        Visibility(
          visible: _showFeedback,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue[100],
                child: const Text(
                  'Your feedback is valuable. Please share your thoughts!',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Your Feedback',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text("Submit Feedback"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
