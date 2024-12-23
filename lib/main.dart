// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Learning/Widget/courceprogress.dart';
import 'package:untitled/notification_controller.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';
import 'package:untitled/test.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationController = Get.put(NotificationController());
  await notificationController.initializeNotifications();
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GetX Notifications Demo',
      debugShowCheckedModeBanner: false,
      //home: MyCoursesScreen(),
      //home: LoadingScreen(),
      //home: SubscriberInfoScreen(),
      //home: TeacherDashboard(),
      //home:Learning(),
      //home: QuizScreen(),
      home: CourseProgress()
      //home: Testchild(),
    );
  }
}
