import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen/Controller/profile_controller.dart';

class ExpandableContainer extends StatefulWidget {
  final double collapsedHeight;
  final double expandedHeight;
  final double width;
  final Color color;
  final IconData icon;
  final Widget expandedContent;
  final String media;
  final ProfileController controller; // Add the controller as a parameter

  const ExpandableContainer({
    super.key,
    this.collapsedHeight = 46.0,
    this.expandedHeight = 296.0,
    this.width = 353.0,
    this.color = Colors.blueAccent,
    required this.icon,
    required this.expandedContent,
    required this.media,
    required this.controller, // Initialize the controller
  });

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: widget.width,
          height: isExpanded ? widget.expandedHeight : widget.collapsedHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: isExpanded ? widget.expandedContent : const Center(),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: IconButton(
            icon: Icon(
              isExpanded ? Icons.expand_less : widget.icon,
              color: const Color(0xFF042763),
              size: 30,
            ),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
                widget.controller.toggleExpand(); // Call toggleExpand method
              });
            },
          ),
        ),
        Positioned(
          top: 10,
          left: 50,
          child: Text(
            widget.media,
            style: const TextStyle(
              fontFamily: 'Jost',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
