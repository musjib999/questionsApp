import 'package:flutter/material.dart';
import 'package:questions_app/services/courses.dart';
import 'package:questions_app/services/databaseService.dart';

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
          body: Center(
            child: Text(
              '${snapshot.data['question']}',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      },
    );
  }
}
