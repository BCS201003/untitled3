import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
import 'package:untitled/ProfileScreen/Models/profilefield_model.dart'; // Import the model

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});
  @override
  DateOfBirthState createState() => DateOfBirthState();
}

class DateOfBirthState extends State<DateOfBirth> {
  Future<void> _selectDate(BuildContext context) async {
    final profileController = Get.find<ProfileController>();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: profileController.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != profileController.selectedDate) {
      profileController.selectedDate = picked;
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      profileController.changeBirth(formattedDate);
      profileController.birthController.text = formattedDate;
      final profileModel = ProfileFieldModel(
        fullName: profileController.nameController.text,
        country: profileController.selectedCountry,
        dateOfBirth: formattedDate,
        city: profileController.selectedCity,
        address: profileController.addressController.text,
        gender: profileController.selectedGender,
        schoolCode: profileController.codeController.text,
        studentGrade: profileController.selectedStudentGrade,
        selectedSchoolList: profileController.selectedSchoolList,
        schoolType: profileController.selectedSchoolType,
        state: profileController.selectedState,
      );
      profileController.saveProfile(profileModel);
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
                readOnly: true,
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
