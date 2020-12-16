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
}
