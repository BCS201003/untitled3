import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class FullNameField extends StatelessWidget {
  final ProfileController controller;

  const FullNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isError = controller.errorMessage.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Full Name',
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
        const SizedBox(height: 4),
        TextField(
          controller: controller.nameController,
          onChanged: (value) {
            controller.changeName(value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: 'Enter full name',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: isError ? Colors.red : Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
