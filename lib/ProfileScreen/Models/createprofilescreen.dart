import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ProfileScreen/Widget/address.dart';
import 'package:untitled/ProfileScreen/Widget/city.dart';
import 'package:untitled/ProfileScreen/Widget/country.dart';
import 'package:untitled/ProfileScreen/Widget/full_name.dart';
import 'package:untitled/ProfileScreen/Widget/gender.dart';
import 'package:untitled/ProfileScreen/Widget/school_code.dart';
import 'package:untitled/ProfileScreen/Widget/school_grade.dart';
import 'package:untitled/ProfileScreen/Widget/school_list.dart';
import 'package:untitled/ProfileScreen/Widget/school_type.dart';
import 'package:untitled/ProfileScreen/Widget/state.dart';
import 'package:untitled/Widgets/Container_widget/screen_loop2.dart';
import 'package:untitled/Widgets/Other_widget/dateofbirth.dart';
import 'package:untitled/Widgets/Other_widget/logout.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}
class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A4B6B),
              border: Border.all(color: Colors.white, width: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                showLogoutDialog(context);
              },
            ),
          ),
        ),
        title: const Text(
          'CREATE PROFILE',
          style: TextStyle(
            color: Color(0xFF2A4B6B),
            fontFamily: 'Jost',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 23.12 / 16,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<ProfileController>(
                init:
                    ProfileController(),
                builder: (controller) {
                  return Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.camera_alt),
                      ),
                      const SizedBox(height: 20),
                      FullNameField(controller: controller),
                      const SizedBox(height: 20),
                      GenderSelector(controller: controller),
                      const Dateofbirth(),
                      const SizedBox(height: 20),
                      SchoolTypeSelector(controller: controller),
                      const SizedBox(height: 15),
                      ///////////////////////////////////////////
                      SchoolList(controller: controller),
                      const SizedBox(height: 15),
                      ///////////////////////////////////////////
                      SchoolCodeInput(controller: controller),
                      const SizedBox(height: 15),
                      ////////////////////////////////////////////
                      SchoolGradeDropdown(controller: controller),
                      const SizedBox(height: 15),
                      ////////////////////////////////////////////
                      CountryDropdown(controller: controller),
                      const SizedBox(height: 15),
                      ////////////////////////////////////////////
                      StateDropdown(controller: controller),
                      const SizedBox(height: 15),
                      ////////////////////////////////////////////
                      CityDropdown(controller: controller),
                      const SizedBox(height: 15),
                      ////////////////////////////////////////////
                      AddressDropdown(controller: controller),
                      const SizedBox(height: 15),
                      AddStudentLoop2(profileController: controller),
                      const SizedBox(height: 4),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
