import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/profile_controller.dart';

class GenderSelector extends StatelessWidget {
  final ProfileController controller;

  const GenderSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Gender',
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
        GetBuilder<ProfileController>(
          builder: (controller) {
            return Column(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: controller.selectedGender,
                      onChanged: (value) => controller.changeGender(value!),
                    ),
                    const Flexible(
                      child: Text(
                        'Male',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Female',
                      groupValue: controller.selectedGender,
                      onChanged: (value) => controller.changeGender(value!),
                    ),
                    const Flexible(
                      child: Text(
                        'Female',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Other',
                      groupValue: controller.selectedGender,
                      onChanged: (value) => controller.changeGender(value!),
                    ),
                    const Flexible(
                      child: Text(
                        'Other',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
