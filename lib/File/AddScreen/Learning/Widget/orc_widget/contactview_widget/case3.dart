import 'package:flutter/material.dart';
import 'package:untitled/File/AddScreen/Learning/Widget/orc_widget/contactview_widget/PointWidget2/verify_certificate.dart';

class Case3Widget extends StatelessWidget {
  const Case3Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 181,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Set the background color to white
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 71,
                    height: 19,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerifyCertificateWidget(),
                          ),
                        );
                         },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF45C881),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 71,
                    height: 19,
                    child: ElevatedButton(
                      onPressed: () {
                        // Download button action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF193E64),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: const Text(
                        'Download',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 5,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/certificate.png',
                width: 172,
                height: 122
              ),
            ],
          ),
        ),
      ),
    );
  }
}
