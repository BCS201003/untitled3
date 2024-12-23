import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class AddStudentLoop2 extends StatefulWidget {
  final ProfileController profileController;
  const AddStudentLoop2({super.key, required this.profileController});

  @override
  State<AddStudentLoop2> createState() => _AddStudentLoop2State();
}

class _AddStudentLoop2State extends State<AddStudentLoop2> {
  @override
  Widget build(BuildContext context) {
    widget.profileController.updateSaveButtonState();

    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.profileController.isSaveButtonEnabled
              ? () {
                  widget.profileController
                      .increment(widget.profileController.NameController.text);
                Navigator.pop(context);
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.profileController.isSaveButtonEnabled
                ? const Color(0xFF042763)
                : Colors.grey,
            minimumSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: const Text(
            'Save Profile Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
