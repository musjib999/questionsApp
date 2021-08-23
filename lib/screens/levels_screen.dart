import 'package:flutter/material.dart';
import 'package:pastq/screens/semester_screen.dart';
import 'package:pastq/shared/globals/global_var.dart';

class LevelPage extends StatefulWidget {
  static String id = 'level';
  final String depertment;
  LevelPage(this.depertment);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  List levels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.depertment),
        backgroundColor: Color(0xff445B83),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.separated(
          itemCount: levels.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                levels[index],
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      level = levels[index];
                      return SemesterPage(
                        depertment: widget.depertment,
                        level: levels[index],
                      );
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
