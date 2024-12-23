import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Models/createprofilescreen.dart';
import 'package:untitled/Widgets/Container_widget/student_mini_profile.dart';
import 'package:get/get.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

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
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 450,
            child: controller.listSubscriberData.isEmpty
                ? const Center(
                    child: Text('No data found'),
                  )
                : ListView.separated(
                    // reverse: true,
                    itemCount: controller.listSubscriberData.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                    itemBuilder: (context, index) {
                      return StudentMiniProfile(
                        grades: controller.listSubscriberData[index]['grades']!,
                        fullName: controller.listSubscriberData[index]['name']!,
                      );
                    },
                  ),
          ),
        ),
        if (controller.errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        (controller.listSubscriberData.length <= 5)
            ? Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A4B6B), // Button color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
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
              )
            : const Center(
         )
      ],
    );
  }
}
