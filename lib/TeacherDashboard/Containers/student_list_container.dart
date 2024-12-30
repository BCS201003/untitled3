import 'package:flutter/material.dart';

class StudentListContainer extends StatefulWidget {
  const StudentListContainer({super.key});

  @override
  StudentListContainerState createState() => StudentListContainerState();
}

class StudentListContainerState extends State<StudentListContainer> {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Fyez Irfan', 'imagePath': 'assets/teacher1.png', 'progress': 0.25, 'color': Colors.red, 'percentage': '25%'},
    {'name': 'Muhammad Ali Khan', 'imagePath': 'assets/teacher2.png', 'progress': 0.50, 'color': Colors.yellow, 'percentage': '50%'},
    {'name': 'Ayesha Ahmed', 'imagePath': 'assets/teacher3.png', 'progress': 0.75, 'color': Colors.yellow, 'percentage': '75%'},
    {'name': 'Sara Ali', 'imagePath': 'assets/teacher4.png', 'progress': 1.0, 'color': Colors.green, 'percentage': '100%'},
  ];

  List<Map<String, dynamic>> _filteredStudents = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredStudents = _students;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredStudents = _students.where((student) {
        return student['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9, // Adjust width to 90% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Adjust horizontal padding
          title: Text(
            'Student List',
            style: TextStyle(
              color: const Color(0xFF042763),
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05, // Adjust font size based on screen width
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Adjust padding based on screen width
              child: TextField(
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search for a student',
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
            ..._filteredStudents.map((student) {
              return _buildStudentTile(
                student['name'],
                student['imagePath'],
                student['progress'],
                student['color'],
                student['percentage'],
                screenWidth,
                screenHeight,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentTile(String name, String imagePath, double progress, Color color, String percentage, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02), // Dynamic margin
      padding: EdgeInsets.all(screenWidth * 0.03), // Dynamic padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: screenWidth * 0.08, // Adjust avatar size based on screen width
          ),
          SizedBox(width: screenWidth * 0.03), // Adjust spacing
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                fontWeight: FontWeight.bold,
                color: const Color(0xFF042763),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03), // Adjust spacing
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage,
                style: TextStyle(
                  color: const Color(0xFF042763),
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Adjust spacing
              SizedBox(
                width: screenWidth * 0.3, // Adjust progress bar width
                height: screenHeight * 0.01, // Adjust progress bar height
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.03), // Adjust spacing
          TextButton(
            onPressed: () {
              // Action when "Details" is pressed
            },
            child: Text(
              'Details',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                color: const Color(0xFF1F7BF4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
