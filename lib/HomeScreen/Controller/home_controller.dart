import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled/Mycources/Controller/mycource_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class MainController extends GetxController {
  final myCourseController = MyCourseController();
  final profileController = ProfileController();

  String errorMessage = '';

  void updateErrorMessage() {
    // You can now safely update the error message outside the build process.
    if (myCourseController.errorMessage.isNotEmpty) {
      errorMessage = myCourseController.errorMessage;
    } else if (profileController.errorMessage.isNotEmpty) {
      errorMessage = profileController.errorMessage;
    } else {
      errorMessage = '';
    }
    // Make sure to call update() to notify listeners, if needed
    update();  // This will notify listeners, and it's safe now.
  }

  @override
  void onInit() {
    super.onInit();

    // Schedule updates after the current build is done using addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myCourseController.addListener(() {
        updateErrorMessage();
      });
      profileController.addListener(() {
        updateErrorMessage();
      });
    });
  }

  void clearAllData() {
    myCourseController.courses.clear();
    profileController.namesList.clear();
    updateErrorMessage();
  }
}
