import 'package:flutter/material.dart';
import 'package:untitled/Dashboard/Widgets/media_container.dart';
import 'package:untitled/Dashboard/Widgets/media_container1.dart';
import 'package:untitled/Dashboard/Widgets/media_container2.dart';
import 'package:untitled/Dashboard/Widgets/media_container3.dart';


class DashboardWG1 extends StatelessWidget implements PreferredSizeWidget {
  final String title1;

  const DashboardWG1({
    super.key,
    required this.title1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const SizedBox(
            height: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MediaContainer3(),
                  MediaContainer2(),
                  MediaContainer(),
                  MediaContainer1(),
                  MediaContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
