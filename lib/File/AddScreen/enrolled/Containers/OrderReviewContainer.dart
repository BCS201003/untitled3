import 'package:flutter/material.dart';

class OrderReviewContainer extends StatelessWidget {
  const OrderReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: const ExpansionTile(
        title: Text(
          'Order Review',
          style: TextStyle(
            color: Color(0xFF042763),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: Color(0xFF343A40), // Expand icon color
        children: [
          ListTile(
            leading: Image(
              image: AssetImage('assets/logo2.png'), // Replace with your image path
              width: 66, // Set width for the image
              height: 48, // Set height for the image
              fit: BoxFit.cover,
            ),
            title: Text(
              'Part I - Media Foundation & Civic Learning',
              style: TextStyle(
                color: Color(0xFF042763),
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Media Instructor',
              style: TextStyle(
                color: Color(0xFF75788D),
              ),
            ),
            trailing: Text(
              'Price:\nPKR 1800',
              style: TextStyle(
                color: Color(0xFF042763),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
