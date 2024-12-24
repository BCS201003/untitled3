import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ProfileScreen/Views/screens/create_profile/createprofilescreen.dart';
import 'package:untitled/Scrible_info/Widgets/student_mini_profile.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class AddStudentLoop extends StatefulWidget {
  const AddStudentLoop({super.key});

  @override
  State<AddStudentLoop> createState() => _AddStudentLoopState();
}

class _AddStudentLoopState extends State<AddStudentLoop> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.updateSaveButtonState();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Student List Section
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: controller.listSubscriberData.isEmpty
                ? const Center(
              child: Text(
                'No data found',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.separated(
              itemCount: controller.listSubscriberData.length,
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10.0),
              itemBuilder: (context, index) {
                final data = controller.listSubscriberData[index];
                return StudentMiniProfile(
                  grades: data['grades']!,
                  fullName: data['name']!,
                );
              },
            ),
          ),
        ),

        // Error Message
        if (controller.errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.errorMessage as String,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

        // Add Student Button
        if (controller.listSubscriberData.length < 5)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A4B6B), // Button color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  controller.handleAddStudentButton();
                  if (controller.errorMessage.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateProfileScreen(),
                      ),
                    );
                  }
                },
                child: const Text("+  Add Student"),
              ),
            ),
          ),

        // No Add Button Placeholder
        if (controller.listSubscriberData.length >= 5)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Maximum of 5 students added.',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
