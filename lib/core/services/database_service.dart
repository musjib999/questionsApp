import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pastq/shared/globals/global_var.dart';
import 'package:pastq/shared/models/course_model.dart';

import 'dropdown_service.dart';

class DatabaseService {
  // final FirebaseStorage _storage = FirebaseStorage.instanceFor(
  //     bucket: 'gs://exam-past-question.appspot.com/');
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get single past question
  Future<DocumentSnapshot> getQuestion(id) async {
    try {
      final coursesCollection = _firestore.collection(depertment);
      var snapshot =
          await coursesCollection.doc(level).collection(semester).doc(id).get();
      return snapshot;
    } catch (e) {
      print("Error >> $e");
    }
    throw 'Null';
    // print(data);
  }

  // //get past all past questions based on the yeae
  Stream<QuerySnapshot> getPastQuestionByYear(year) {
    var snapshot = _firestore
        .collection(
            level == 'Level 1' ? depertment = depertments[0] : depertment)
        .doc(level)
        .collection(semester)
        .where("year", isEqualTo: "$year")
        .snapshots();

    return snapshot;

    // print(data);
  }

  Future<List<Course>> getQuestionSuggestion(String query) async {
    final coursesCollection = _firestore.collection(depertment);
    var snapshot = await coursesCollection
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

  //get past all past questions based on the yeae
  Stream<QuerySnapshot> getGspPastQuestionByYear(year) {
    var snapshot = _firestore
        .collection('General Studies and Enterpreneurship')
        .where("year", isEqualTo: "$year")
        .snapshots();

    return snapshot;

    // print(data);
  }

  // //upload file to firebase storage
  Future uploadPastQ(
      {
      //     {required String filePath,
      //     required String fileName,
      //     required String courseTitle,
      //     required String depertment,
      //     required String level,
      //     required String semester,
      //     required String year,
      required BuildContext context}) async {
    //   try {
    //     File file = File(filePath);
    //     await _storage
    //         .ref('$depertment/$level/$semester/$fileName.pdf')
    //         .putFile(file);
    //     var url = await _storage
    //         .ref('$depertment/$level/$semester/$fileName.pdf')
    //         .getDownloadURL();
    //     print('We got this url >>> ${url.toString()}');
    //     await _firestore
    //         .collection(depertment)
    //         .doc(level)
    //         .collection(semester)
    //         .add({
    //       'courseCode': fileName,
    //       'title': courseTitle,
    //       'question': url,
    //       'year': year,
    //       'status': 0
    //     });
    //   } catch (e) {
    //     print(e);
    //   }
  }
}
