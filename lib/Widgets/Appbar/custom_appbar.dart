import 'package:flutter/material.dart';

const TextStyle appBarTitleStyle = TextStyle(
  color: Color(0xFF2A4B6B),
  fontFamily: 'Jost',
  fontWeight: FontWeight.w600,
  height: 23.12 / 16,
  letterSpacing: 1,
);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(screenWidth * 0.0065),
        child: Container(
          width: screenWidth * 0.05,
          height: screenWidth * 0.05,
          decoration: BoxDecoration(
            color: const Color(0xFF2A4B6B),
            border: Border.all(color: Colors.white, width: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            tooltip: 'Back',
            onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF2A4B6B),
          fontFamily: 'Jost',
          fontSize: screenWidth * 0.05,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
