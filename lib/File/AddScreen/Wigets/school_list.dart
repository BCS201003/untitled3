import 'package:flutter/material.dart';
import 'package:untitled/profile_controller.dart';

class SchoolList extends StatefulWidget {
  final ProfileController controller;

  const SchoolList({super.key, required this.controller});

  @override
  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  late String selectedSchool;

  @override
  void initState() {
    super.initState();
    // Initialize with the value from the controller
    selectedSchool = widget.controller.selectedSchoolList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Select School',
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: selectedSchool,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedSchool = newValue;
                });
                widget.controller.changeSchoolList(newValue);
              }
            },
            items: <String>['FGEI', 'School A', 'School B']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
