import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pastq/shared/global/config.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/models/course_model.dart';

import 'dropdown_service.dart';

class DatabaseService {
  Future addPastQuestion(Map<String, dynamic> data) async {
    dynamic document;
    try {
      document = await firestore
          .collection(depertment)
          .doc(level)
          .collection(semester)
          .add(data);
    } catch (err) {
      print('Error adding document to database $err');
    }
    return document;
  }

  //get past all past questions by year
  Stream<QuerySnapshot> getGspPastQuestionByYear(year) {
    Stream<QuerySnapshot>? snapshot;
    try {
      snapshot = firestore
          .collection('General Studies and Enterpreneurship')
          .where("year", isEqualTo: "$year")
          .snapshots();

      return snapshot;
    } catch (err) {
      print('Error getting GSP past questions by year >> $err');
    }
    return snapshot!;
    // print(data);
  }

  // //get past all past questions by year
  Stream<QuerySnapshot> getPastQuestionByYear(
      {required String deperment,
      required String level,
      required String semester,
      required String year}) {
    Stream<QuerySnapshot>? snapshot;
    try {
      snapshot = firestore
          .collection(deperment)
          .doc(level)
          .collection(semester)
          .where("year", isEqualTo: "$year")
          .snapshots();
      snapshot.forEach((element) {
        print(element.docs.length);
      });
    } catch (err) {
      print('Error getting past questions by year >> $err');
    }

    return snapshot!;
  }

  Future<List<Course>> getQuestionSuggestion(String query) async {
    final coursesCollection = firestore.collection(depertment);
    var snapshot = depertment == depertments[0]
        ? await firestore
            .collection('General Studies and Enterpreneurship')
            .where("year", isEqualTo: "$selectedYear")
            .get()
        : await coursesCollection
            .doc(level)
            .collection(semester)
            .where("year", isEqualTo: "$selectedYear")
            .get();
    List suggestion = snapshot.docs;
    return suggestion
        .map((json) => Course.fromJson(json.data()))
        .where((course) {
      final nameLower = course.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    // return suggestion;
  }

  // //upload file to firebase storage
  Future<String?> uploadPastQuestion(
      {required String filePath,
      required String fileName,
      required String courseTitle,
      required String depertment,
      required String level,
      required String semester,
      required String year}) async {
    File file = File(filePath);
    await storage
        .ref('$depertment/$level/$semester/$fileName.pdf')
        .putFile(file);
    String url = await storage
        .ref('$depertment/$level/$semester/$fileName.pdf')
        .getDownloadURL();

    print('We got this url >>> ${url.toString()}');
    return url.toString();
  }
}
