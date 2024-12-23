import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  String selectedSchoolList = 'FGEI';
  String selectedGender = 'Male';
  String selectedSchoolType = 'Regular Schooling';
  String selectedStudentGrade = '8th(Part 1)';
  String selectedCountry = 'Pakistan';
  String selectedState = 'Punjab';
  String selectedCity = 'Islamabad';

  final TextEditingController NameController = TextEditingController();
  final TextEditingController CodeController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController BirthController = TextEditingController();
  final TextEditingController CourseController = TextEditingController();

  DateTime? selectedDate;
  final List<String> namesList = [];
  var incremental = 0;
  var showAddButton = true;
  var errorMessage = ' ';
  var isSaveButtonEnabled = false;

  final List<String> courses = [];
  var isExpanded = false;

  void addCourse(String courseName) {
    if (courses.length < 10) {
      courses.add(courseName);
      update();
    } else {
      errorMessage = "Maximum number of courses reached!";
      update();
    }
  }

  void removeCourse(int index) {
    if (index >= 0 && index < courses.length) {
      courses.removeAt(index);
      update();
    }
  }

  void updateSaveButtonState() {
    isSaveButtonEnabled = NameController.text.isNotEmpty &&
        CodeController.text.isNotEmpty &&
        AddressController.text.isNotEmpty;
  }

  void changeName(String value) {
    if (namesList.length < 5 && value.isNotEmpty) {
      namesList.add(value);
      NameController.clear();
      update();
    } else if (namesList.length >= 5) {
      namesList.removeAt(0);
      namesList.add(value);
      update();
    }
  }

  List<Map<String, String>> listSubscriberData = [];

  void increment(
      String fullName,
      ) {
    listSubscriberData.add(
      {
        'name': NameController.text,
        'gender': selectedGender,
        'grades': selectedStudentGrade,
        'state': selectedState,
      },
    );
    update();
  }

  void changeBirth(String value) {
    BirthController.text = value;
    update();
  }

  void changeCode(String value) {
    CodeController.text = value;
    update();
  }

  void changeAddress(String value) {
    AddressController.text = value;
    update();
  }

  void changeSchoolList(String newValue) {
    selectedSchoolList = newValue;
    update();
  }

  void changeSchoolType(String newValue) {
    selectedSchoolType = newValue;
    update();
  }

  void changeGender(String newValue) {
    selectedGender = newValue;
    update();
  }

  void changeStudentGrade(String newValue) {
    selectedStudentGrade = newValue;
    update();
  }

  void changeCountry(String newValue) {
    selectedCountry = newValue;
    update();
  }

  void changeCity(String newValue) {
    selectedCity = newValue;
    update();
  }

  void changeState(String newValue) {
    selectedState = newValue;
    update();
  }

  void handleAddStudentButton() {
    if (listSubscriberData.length >= 5) {
      showAddButton = false;
    } else {
      showAddButton = true;
    }
  }

  bool toggleExpand() {
    isExpanded = !isExpanded;
    return isExpanded;
  }
}

