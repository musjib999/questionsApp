// import 'course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

String semester;
String level;

//levelOne courses
var levelOneFirstSemesterCourses = _firestore.collection('courses').snapshots();
var levelOneSecondSemesterCourses =
    _firestore.collection('levelOneSecondSemesterCourses').snapshots();

//levelTwo courses
var levelTwoFirstSemesterCourses =
    _firestore.collection('levelTwoFirstSemesterCourses').snapshots();
var levelTwoSecondSemesterCourses =
    _firestore.collection('levelTwoSecondSemesterCourses').snapshots();

Stream<dynamic> getCoursesStream() {
  if (level == 'Level 1' && semester == 'First') {
    return levelOneFirstSemesterCourses;
  } else if (level == 'Level 1' && semester == 'Second') {
    return levelOneSecondSemesterCourses;
  } else if (level == 'Level 2' && semester == 'First') {
    return levelTwoFirstSemesterCourses;
  } else if (level == 'Level 2' && semester == 'Second') {
    return levelTwoSecondSemesterCourses;
  } else {
    return null;
  }
}
