import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
import 'package:untitled/Widgets/Padding_weight/pts_weight.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'hello'),
      body: const PTSWidget(),
    );
  }
}