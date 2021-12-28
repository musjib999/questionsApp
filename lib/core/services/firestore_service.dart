import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllDoc({required String collection, String? year}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? documets;
    try {
      await firestore
          .collection(collection)
          .where("year", isEqualTo: year)
          .get()
          .then((value) {
        documets = value.docs;
      });
    } catch (e) {
      documets = [];
      throw 'Error occured $e';
    }
    return documets;
  }

  Future getAllDocInCollection(
      {required String firstCollection,
      required String documentId,
      required String secondCollection,
      required String year}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? documets;
    try {
      await firestore
          .collection(firstCollection)
          .doc(documentId)
          .collection(secondCollection)
          .where("year", isEqualTo: year)
          .get()
          .then((value) {
        documets = value.docs;
      });
    } catch (e) {
      documets = [];
      throw 'Error occured $e';
    }
    return documets;
  }

  Future getOneDoc({required String collection, required String id}) async {
    DocumentSnapshot<Map<String, dynamic>>? document;
    try {
      await firestore.collection(collection).doc(id).get().then((value) {
        document = value;
      });
    } catch (e) {
      throw 'Error occured $e';
    }
    return document;
  }

  Future getOneDocInCollection(
      {required String firstCollection,
      required String documentId,
      required String secondCollection,
      required String id}) async {
    DocumentSnapshot<Map<String, dynamic>>? document;
    try {
      await firestore
          .collection(firstCollection)
          .doc(documentId)
          .collection(secondCollection)
          .doc(id)
          .get()
          .then((value) {
        document = value;
      });
    } catch (e) {
      throw 'Error occured $e';
    }
    return document;
  }

  Future addDoc(
      {required String collection, required Map<String, dynamic> data}) async {
    DocumentReference<Map<String, dynamic>>? document;
    try {
      await firestore.collection(collection).add(data).then((value) {
        document = value;
      });
    } catch (e) {
      throw 'Error occured $e';
    }
    return document;
  }

  Future<bool?> updateDoc(
      {required String collection,
      required String id,
      required Map<String, dynamic> data}) async {
    bool? isUpdated;
    try {
      await firestore.collection(collection).doc(id).update(data).then((value) {
        isUpdated = true;
      });
    } catch (e) {
      isUpdated = false;
      throw 'Error occured $e';
    }
    return isUpdated;
  }

  Stream<QuerySnapshot> getDocStream(
      {required String collection, required String year}) {
    Stream<QuerySnapshot>? snapshot;
    try {
      snapshot = firestore
          .collection(collection)
          .where('year', isEqualTo: year)
          .snapshots();
    } catch (e) {
      throw 'Error occured $e';
    }
    return snapshot;
  }

  Stream<QuerySnapshot> getDocStreamInCollection(
      {required String firstCollection,
      required String documentId,
      required String secondCollection,
      required String year}) {
    Stream<QuerySnapshot>? snapshot;
    try {
      snapshot = firestore
          .collection(firstCollection)
          .doc(documentId)
          .collection(secondCollection)
          .where("year", isEqualTo: "$year")
          .snapshots();
    } catch (err) {
      print('Error getting past questions by year >> $err');
    }

    return snapshot!;
  }

  Future<bool?> deleteDoc(
      {required String collection, required String id}) async {
    bool? isDeleted;
    try {
      await firestore.collection(collection).doc(id).delete().then((value) {
        isDeleted = true;
      });
    } catch (e) {
      isDeleted = false;
      throw 'Error occured $e';
    }
    return isDeleted;
  }
}
