import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:untitled/profile_controller.dart';

class Dateofbirth extends StatefulWidget {
  const Dateofbirth({super.key});

  @override
  _DateofbirthState createState() => _DateofbirthState();
}

class _DateofbirthState extends State<Dateofbirth> {
  Future<void> _selectDate(BuildContext context) async {
    // Access ProfileController instance
    final profileController = Get.find<ProfileController>();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: profileController.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != profileController.selectedDate) {
      // Update the controller and UI state
      profileController.selectedDate = picked;
      profileController.changeBirth(DateFormat('yyyy-MM-dd').format(picked));
      profileController.BirthController.text =
          DateFormat('yyyy-MM-dd').format(picked); // Sync with the text field

      // Notify listeners of state change
      profileController.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 31.78 / 14,
                      color: Color(0xFF042763),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '*',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 31.78 / 14,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true, // Make the TextFormField non-editable
                controller: TextEditingController(
                  text: controller.selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(controller.selectedDate!)
                      : null,
                ),
                onTap: () => _selectDate(context),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Enter Date of Birth',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
