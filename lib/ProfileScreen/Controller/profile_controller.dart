// profile_controller.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ProfileScreen/Models/profilefield_model.dart';
class ProfileController extends GetxController {
  String selectedSchoolList = 'FGEI';
  String selectedGender = 'Male';
  String selectedSchoolType = 'Regular Schooling';
  String selectedStudentGrade = '8th(Part 1)';
  String selectedCountry = 'Pakistan';
  String selectedState = 'Punjab';
  String selectedCity = 'Islamabad';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  DateTime? selectedDate;
  final List<String> namesList = [];
  var incremental = 0;
  var showAddButton = true;

  var errorMessage = ''.obs;

  var isSaveButtonEnabled = false.obs;

  void updateSaveButtonState() {
    isSaveButtonEnabled.value = nameController.text.isNotEmpty &&
        codeController.text.isNotEmpty &&
        addressController.text.isNotEmpty;
  }

    void increment(String fullName) {
    listSubscriberData.add(
      {
        'name': nameController.text,
        'gender': selectedGender,
        'grades': selectedStudentGrade,
        'state': selectedState,
      },
    );
    update();
  }

  void changeName(String value) {
    if (namesList.length < 5 && value.isNotEmpty) {
      namesList.add(value);
      nameController.clear();
      update();
    } else if (namesList.length >= 5) {
      namesList.removeAt(0);
      namesList.add(value);
      update();
    }
  }

  void changeBirth(String value) {
    birthController.text = value;
    update();
  }

  void changeCode(String value) {
    codeController.text = value;
    update();
  }

  void changeAddress(String value) {
    addressController.text = value;
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
  List<Map<String, String>> listSubscriberData = [];


  void handleAddStudentButton() {
    if (listSubscriberData.length >= 5) {
      showAddButton = false;
    } else {
      showAddButton = true;
    }
  }

  void validateFullName(String value) {
    if (value.isEmpty) {
      errorMessage.value = 'Full name is required';
    } else if (value.length < 3) {
      errorMessage.value = 'Full name should be at least 3 characters';
    } else {
      errorMessage.value = '';
    }
    updateSaveButtonState();
  }

  void saveProfile(ProfileFieldModel profileModel) {
    try {
      if (kDebugMode) {
        print("Saving profile: ${profileModel.toJson()}");
      }
      if (kDebugMode) {
        print('Profile saved successfully');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error saving profile: $error');
      }
    }
  }
}
