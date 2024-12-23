import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/enrolled/enroll.dart';

class MediaContainer extends StatelessWidget {
  const MediaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      height: 245,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/MediaFoundation.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  const Text(
                    'Part I - Media Foundation & Civic Learning',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star_border, color: Colors.amber, size: 16),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text(
                        'Price :PKR 1899',
                        style: TextStyle(
                          fontFamily: 'Jost', // Set the font family to Jost
                          fontSize: 8, // Font size in logical pixels
                          color: Color(0xFF042763), // Font color
                          fontWeight: FontWeight.w500, // Font weight (500 for medium weight)
                          height: 10.64 / 8, // Line height as a multiplier of font size
                          decorationStyle: TextDecorationStyle.solid, // Solid underline style
                        ),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                      // Spacer(),
                      SizedBox(width: 8),
                      Text(
                        'PKR 2000',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: SizedBox(
                      width: 129, // Set the width of the button
                      height: 21, // Set the height of the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EnrollScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A4B6B), // Set the background color
                          foregroundColor: Colors.white, // Set the text color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), // Set radius of 5 for all corners
                          ),
                        ),
                        child: const Text(
                          'Enroll',
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}