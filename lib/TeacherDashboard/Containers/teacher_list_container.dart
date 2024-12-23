import 'package:flutter/material.dart';

class TeacherListContainer extends StatefulWidget {
  const TeacherListContainer({super.key});

  @override
  TeacherListContainerState createState() => TeacherListContainerState();
}

class TeacherListContainerState extends State<TeacherListContainer> {
  final List<Map<String, dynamic>> _teachers = [
    {'name': 'Fyez Irfan', 'imagePath': 'assets/teacher1.png', 'progress': 0.25, 'color': Colors.red, 'percentage': '25%'},
    {'name': 'Muhammad Ali Khan', 'imagePath': 'assets/teacher2.png', 'progress': 0.50, 'color': Colors.yellow, 'percentage': '50%'},
    {'name': 'Ayesha Ahmed', 'imagePath': 'assets/teacher3.png', 'progress': 0.75, 'color': Colors.yellow, 'percentage': '75%'},
    {'name': 'Sara Ali', 'imagePath': 'assets/teacher4.png', 'progress': 1.0, 'color': Colors.green, 'percentage': '100%'},
  ];

  List<Map<String, dynamic>> _filteredTeachers = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredTeachers = _teachers;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredTeachers = _teachers.where((teacher) {
        return teacher['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: const Text(
            'Teacher List',
            style: TextStyle(
              color: Color(0xFF042763),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search for a teacher',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            ..._filteredTeachers.map((teacher) {
              return _buildTeacherTile(
                teacher['name'],
                teacher['imagePath'],
                teacher['progress'],
                teacher['color'],
                teacher['percentage'],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherTile(String name, String imagePath, double progress, Color color, String percentage) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      width: 323,
      height: 68,  // Adjust height to fit content
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF042763),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage,
                style: const TextStyle(
                  color: Color(0xFF042763),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 50,
                height: 4,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Action when "Log In as Teacher" is pressed
            },
            child: const Text(
              'Log In as Teacher',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 12,
                color: Color(0xFF1F7BF4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
