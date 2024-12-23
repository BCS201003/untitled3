import 'package:flutter/material.dart';

class Testchild extends StatelessWidget {
  const Testchild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200,
          maxWidth: 300,
        ),
        child: Container(color: Colors.red),
      ),
    );
  }
}
