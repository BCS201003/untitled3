import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/dashboard.dart';
import 'package:untitled/Scrible_info/Widgets/screen_loop.dart';
import 'package:untitled/Widgets/Other_widget/logout.dart';

class SubscriberInfoScreen extends StatelessWidget {
  const SubscriberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              // Positioned Logout button
              Positioned(
                top: 25,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.power_settings_new_outlined),
                  color: Colors.grey,
                  onPressed: () {
                    showLogoutDialog(context);
                  },
                ),
              ),
              // Positioned logo image at the top center
              Positioned(
                top: -5,
                left: MediaQuery.of(context).size.width / 2 - 100,
                child: Image.asset(
                  'assets/logo2.png',
                  height: MediaQuery.of(context).size.height * 0.25, // Use relative height
                ),
              ),
              // Main content (Subscriber Info)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25), // Adjust based on screen height
                  Text(
                    "  Subscriber Info",
                    style: TextStyle(
                      color: const Color(0xFF2A4B6B),
                      fontFamily: 'Jost',
                      fontSize: MediaQuery.of(context).size.width * 0.08, // Font size based on screen width
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Hello (Subscriber Name)",
                      style: TextStyle(
                        color: const Color(0xFF042763),
                        fontFamily: 'Jost',
                        fontSize: MediaQuery.of(context).size.width * 0.06, // Font size based on screen width
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const AddStudentLoop(),
                ],
              ),
            ],
          ),
        ),
      ),
      // Floating action button to navigate to Dashboard
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        },
        backgroundColor: const Color(0xFF2A4B6B),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
