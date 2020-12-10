import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastQ/screens/question_screen.dart';
import 'package:pastQ/services/courses.dart';

class CoursesPage extends StatefulWidget {
  static String id = 'courses';

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$semester Semester Courses'),
        backgroundColor: Color(0xff445B83),
      ),
      body: CoursesStreamBuilder(),
    );
  }
}

class CoursesStreamBuilder extends StatefulWidget {
  @override
  _CoursesStreamBuilderState createState() => _CoursesStreamBuilderState();
}

class _CoursesStreamBuilderState extends State<CoursesStreamBuilder> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Software Engineering')
          .document(level)
          .collection(semester)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final titles = snapshot.data.documents;
        List<Widget> coursesTitleWidgets = [];
        for (var title in titles) {
          final courseTitle = title.data['title'];
          final courseCode = title.data['courseCode'];
          final documentId = title.documentID;
          final courseTitleWidget = ListTile(
            title: Text('$courseTitle'),
            subtitle: Text('$courseCode'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QuestionPage(
                      docId: documentId,
                    );
                  },
                ),
              );
            },
          );
          coursesTitleWidgets.add(courseTitleWidget);
        }
        return ListView(
          children: coursesTitleWidgets,
        );
      },
    );
  }
}
