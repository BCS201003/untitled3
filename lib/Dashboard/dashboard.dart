import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/Widgets/wg.dart';
import 'package:untitled/Dashboard/Widgets/wg1.dart';
import 'package:untitled/Dashboard/Widgets/wg2.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class Dashboard extends StatelessWidget {
  final ProfileController controller = ProfileController();
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'MY COURSES',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body:const Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardWG(title1: 'Categories Title 1',),
              DashboardWG1(title1: 'Categories Title 2'),
              DashboardWG2(title1: 'Categories Title 3'),
              DashboardWG(title1: 'Categories Title 4',),
              DashboardWG2(title1: 'Categories Title 5',),
              DashboardWG1(title1: 'Categories Title 6',),
            ],
          ),
        ),
      ),
    );
  }
}
