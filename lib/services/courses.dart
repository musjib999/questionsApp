// import 'course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

String semester;
String level;
String searchString;

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

Stream getCoursesStreamSearch() {
  if (level == 'Level 1' && semester == 'First') {
    return _firestore
        .collection('courses')
        .where("searchIndex", arrayContains: searchString)
        .snapshots();
  } else if (level == 'Level 1' && semester == 'Second') {
    return _firestore
        .collection('levelOneSecondSemesterCourses')
        .where("searchIndex", arrayContains: searchString)
        .snapshots();
  } else if (level == 'Level 2' && semester == 'First') {
    return _firestore
        .collection('levelTwoFirstSemesterCourses')
        .where("searchIndex", arrayContains: searchString)
        .snapshots();
  } else if (level == 'Level 2' && semester == 'Second') {
    return _firestore
        .collection('levelTwoSecondSemesterCourses')
        .where("searchIndex", arrayContains: searchString)
        .snapshots();
  } else {
    return null;
  }
}
