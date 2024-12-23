import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        height: 227,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/Course.png',
              scale: 1,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Part I - Media Foundation & Civic Learning',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.33,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Row(
                      children: [
                        Text('★★★★☆',selectionColor: Colors.yellow),
                        Spacer(),
                        Text('Enroll'),
                      ],
                    ),
                    Text('Not Eligible', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
