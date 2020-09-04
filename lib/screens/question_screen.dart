import 'package:flutter/material.dart';
import 'package:questions_app/services/courses.dart';
import 'package:questions_app/services/databaseService.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({@required this.id});
  final id;

  @override
  Widget build(BuildContext context) {
    dynamic collection;
    if (level == 'Level 1' && semester == 'First') {
      collection = 'courses';
    } else if (level == 'Level 1' && semester == 'Second') {
      collection = 'levelOneSecondSemesterCourses';
    } else if (level == 'Level 2' && semester == 'First') {
      collection = 'levelTwoFirstSemesterCourses';
    } else if (level == 'Level 2' && semester == 'Second') {
      collection = 'levelTwoSecondSemesterCourses';
    } else {
      return null;
    }
    return FutureBuilder(
      future: DatabaseService().getQuestion(id, collection),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Loading...'),
              backgroundColor: Color(0xff445B83),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('${snapshot.data['title']}'),
            backgroundColor: Color(0xff445B83),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/buk.png',
                      width: 50,
                    ),
                    Text(
                      'BAYERO UNIVERSITY, KANO',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'FACULTY OF COMPUTER SCIENCE AND INFORMATION TECHNOLOGY',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${snapshot.data['id']} - (${snapshot.data['title']})',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${snapshot.data['question']}',
                  style: TextStyle(wordSpacing: 3.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
