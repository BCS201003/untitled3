import 'package:untitled/notification_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Other_widget/my_button_neg.dart';
import 'package:untitled/Widgets/Other_widget/drawer_neg.dart';
import 'package:untitled/Widgets/Other_widget/logout.dart';
import 'package:untitled/profile_activity.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Offset _offset = const Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  late AnimationController _animationController;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get NotificationController instance
    final NotificationController notificationController =
        Get.put(NotificationController());

    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey, Colors.white12],
            ),
          ),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Center(
                child: MaterialButton(
                  color: Colors.white,
                  child: const Text(
                    "Mediatiz",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                left: isMenuOpen ? 0 : -sidebarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sidebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sidebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }
                      if (details.localPosition.dx > sidebarSize - 20 &&
                          details.delta.distanceSquared > 2) {
                        setState(() {
                          isMenuOpen = true;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = const Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sidebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        SizedBox(
                          height: mediaQuery.height,
                          width: sidebarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: mediaQuery.height * 0.25,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/logo2.png",
                                          width: sidebarSize / 2),
                                      const Text(
                                        "RetroPortal Studio",
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(thickness: 1),
                              SizedBox(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: <Widget>[
                                    MyButton(
                                      text: "Profile",
                                      iconData: Icons.person,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileScreen()),
                                        );
                                      },
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),
                                    MyButton(
                                      text: "Payments",
                                      iconData: Icons.payment,
                                      onPressed: () {
                                        // Show notification when Payments button is pressed
                                        notificationController
                                            .showPaymentNotification();
                                      },
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),
                                    MyButton(
                                      text: "Notifications",
                                      iconData: Icons.notifications,
                                      onPressed: () {},
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),
                                    MyButton(
                                      text: "Settings",
                                      iconData: Icons.settings,
                                      onPressed: () {},
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),
                                    MyButton(
                                      text: "file",
                                      iconData: Icons.attach_file,
                                      onPressed: () {},
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),
                                    MyButton(
                                      text: "logout",
                                      iconData: Icons.lock,
                                      onPressed: () {
                                        showLogoutDialog(context);
                                      },
                                      textSize: 16.0, // Reasonable text size
                                      height: 50.0, // Fixed button height
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
