import 'package:flutter/material.dart';

class LessonWidget2 extends StatefulWidget {


  const LessonWidget2({
    super.key,
  });

  @override
  LessonWidget2State createState() => LessonWidget2State();
}

class LessonWidget2State extends State<LessonWidget2> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: !_isExpanded ? Colors.transparent : Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: _isExpanded
            ? const Icon(Icons.expand_less, color: Color(0xFF343A40))
            : const Icon(Icons.expand_more, color: Color(0xFF343A40)),
        title: const Text(
          'Lesson 2',
          style: TextStyle(
            color: Color(0xFF042763),
            fontFamily: 'Jost',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '4 Components  ',
              style: TextStyle(
                color: Color(0xFF042763),
                fontFamily: 'Jost',
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.check_circle_sharp,
              color: Colors.green,
            ),
          ],
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.withOpacity(0.5)),

        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() => _isExpanded = expanded);
        },
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Expanded content goes here.',
              style: TextStyle(fontSize: 12, color: Color(0xFF75788D)),
            ),
          ),
        ],
      ),
    );
  }
}
