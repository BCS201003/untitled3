import 'package:flutter/material.dart';
import 'package:untitled/ProfileScreen/Views/screens/create_profile/createprofilescreen.dart';
import 'package:untitled/Scrible_info/Widgets/student_mini_profile.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class AddStudentLoop extends StatefulWidget {
  const AddStudentLoop({super.key});

  @override
  State<AddStudentLoop> createState() => _AddStudentLoopState();
}

class _AddStudentLoopState extends State<AddStudentLoop> {
  final ProfileController controller = ProfileController();

  @override
  void initState() {
    super.initState();
    controller.updateSaveButtonState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double verticalPadding = mediaQuery.size.height * 0.02;
    final double horizontalPadding = mediaQuery.size.width * 0.04;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: horizontalPadding),
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
              shrinkWrap: true,
              itemCount: controller.listSubscriberData.length,
              separatorBuilder: (context, index) => SizedBox(height: verticalPadding),
              itemBuilder: (context, index) {
                final data = controller.listSubscriberData[index];
                return StudentMiniProfile(
                  grades: data['grades']!,
                  fullName: data['name']!,
                );
              },
            ),
          ),

          if (controller.errorMessage.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: Text(
                controller.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          if (controller.listSubscriberData.length < 5)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: SizedBox(
                width: double.infinity,
                height: mediaQuery.size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A4B6B),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: verticalPadding * 0.6),
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
          if (controller.listSubscriberData.length >= 5)
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: const Center(
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
      ),
    );
  }
}
