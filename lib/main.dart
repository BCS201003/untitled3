// get.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/HomeScreen/Controller/home_controller.dart';
import 'package:untitled/Mycources/Controller/mycource_controller.dart';
import 'package:untitled/Wigets/get_put_delete_post.dart';
import 'package:untitled/notification_controller.dart';
import 'package:untitled/ProfileScreen/Controller/profile_controller.dart';
import 'package:untitled/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationController = Get.put(NotificationController());
  await notificationController.initializeNotifications();
  Get.put(ProfileController(),permanent: true);
  Get.put(MainController(),permanent: true);
  Get.put(MyCourseController(),permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GetX Notifications Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
