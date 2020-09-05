import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future getQuestion(id, collection) async {
    final coursesCollection = Firestore.instance.collection(collection);
    var snapshot = await coursesCollection.document(id).get();
    var data = snapshot.data;
    return data;
    // print(data);
  }
}
