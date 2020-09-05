import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:questions_app/screens/question_screen.dart';
import 'package:questions_app/services/courses.dart';

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
      // body: ListView.separated(
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(
      //         getCourses()[index].courseTitle,
      //       ),
      //       onTap: () {
      //         Navigator.push(context, MaterialPageRoute(
      //           builder: (context) {
      //             return QuestionPage(
      //               course: getCourses()[index],
      //             );
      //           },
      //         ));
      //       },
      //     );
      //   },
      //   separatorBuilder: (BuildContext context, int index) => Divider(),
      //     itemCount: getCourseItemCount(),
      // ),
      body: CoursesStreamBuilder(),
    );
  }
}

class CoursesStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getCoursesStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final titles = snapshot.data.documents;
        List<ListTile> coursesTitleWidgets = [];
        for (var title in titles) {
          final courseTitle = title.data['title'];
          final courseCode = title.data['id'];
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
