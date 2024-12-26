import 'package:get/get.dart';

class MyCourseController extends GetxController {
  final List<String> courses = [];
  final String errorMessage = '';
  var isExpanded = false;

  bool toggleExpand() {
    isExpanded = !isExpanded;
    return isExpanded;
  }

  void removeCourse(int index) {
    if (index >= 0 && index < courses.length) {
      courses.removeAt(index);
    }
  }

  void addCourse(String courseName) {
    if (courses.length < 10) {
      courses.add(courseName);
    } else {}
  }
}
