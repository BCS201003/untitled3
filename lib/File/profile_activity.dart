import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0; // To track which section is selected

  final List<String> _titles = ["Personal Info", "Experience", "Review"];

  final List<Widget> _sections = [
    const PersonalInfoSection(),
    const ExperienceSection(),
    const ReviewSection(),
  ];

  void _onSectionChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_titles.length, (index) {
              return TextButton(
                onPressed: () => _onSectionChanged(index),
                child: Text(
                  _titles[index],
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.blue : Colors.grey,
                    fontSize: 18,
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: _sections[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Personal Information Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Experience Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Review Content',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}