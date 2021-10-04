import 'package:flutter/material.dart';
import 'package:pastq/screens/courses_screen.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/widgets/cards/semester_card.dart';

class SemesterPage extends StatefulWidget {
  static String id = 'semester';
  final String depertment;
  final String level;

  SemesterPage({required this.depertment, required this.level});

  @override
  _SemesterPageState createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  List semesters = ['First Semester', 'Second Semester'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.level),
        backgroundColor: Color(0xff445B83),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
          itemCount: semesters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: SemesterCard(title: semesters[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      semester = semesters[index];
                      return CoursesPage(
                        depertment: widget.depertment,
                        level: widget.level,
                        semester: semesters[index],
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
