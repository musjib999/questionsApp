import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pastQ/services/courses.dart';
import 'package:pastQ/services/depertment.dart';

class DatabaseService {
  Future getQuestion(id) async {
    try {
      final coursesCollection = Firestore.instance.collection(depertment);
      var snapshot = await coursesCollection
          .document(level)
          .collection(semester)
          .document(id)
          .get();
      var data = snapshot.data;
      print(data);
      return data;
    } catch (e) {
      print("Error >> $e");
    }

    // print(data);
  }

  Stream<QuerySnapshot> getPastQuestionYear(year) {
    final _firestore = Firestore.instance;
    var snapshot = _firestore
        .collection(
            level == 'Level 1' ? depertment = depertments[0] : depertment)
        .document(level)
        .collection(semester)
        .where("year", isEqualTo: "$year")
        .snapshots();
    return snapshot;

    // print(data);
  }
}
