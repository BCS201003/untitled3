import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class StudentMiniProfile extends StatelessWidget {
  const StudentMiniProfile({super.key,required this.fullName,required this.grades});

  final String fullName;
  final String grades;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final profileController = Get.find<ProfileController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 353,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.account_circle,
              size: 69,
              color: Color(0xFF2A4B6B),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fullName.isEmpty
                          ? 'Name not available'
                          : fullName,
                      style: const TextStyle(
                        color: Color(0xFF2A4B6B),
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: screenWidth * 0.05,
                      endIndent: screenWidth * 0.05,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      profileController.selectedStudentGrade.isEmpty
                          ? 'Grade not available'
                          : grades,
                      style: const TextStyle(
                        color: Color(0xFF2A4B6B),
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}