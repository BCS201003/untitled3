import 'package:get/get.dart';
import 'package:untitled/Mycources/Controller/mycource_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';

class MainController extends GetxController {
  // Instances of individual controllers
  final myCourseController = MyCourseController();
  final profileController = ProfileController();

  // A shared error message variable
  String errorMessage = '';

  // To handle both controllers' error states
  void updateErrorMessage() {
    if (myCourseController.errorMessage.isNotEmpty) {
      errorMessage = myCourseController.errorMessage.value;
    } else if (profileController.errorMessage.isNotEmpty) {
      errorMessage = profileController.errorMessage.value;
    } else {
      errorMessage = '';
    }
    update(); // Notify listeners
  }

  @override
  void onInit() {
    super.onInit();

    // Bind errorMessage updates to changes in the individual controllers
    ever(myCourseController.errorMessage, (_) => updateErrorMessage());
    ever(profileController.errorMessage, (_) => updateErrorMessage());
  }

  // Shared logic example (if needed)
  void clearAllData() {
    myCourseController.courses.clear();
    profileController.namesList.clear();
    updateErrorMessage();
  }
}
