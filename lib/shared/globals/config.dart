import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// ignore: unused_element
final FirebaseStorage storage =
    FirebaseStorage.instanceFor(bucket: 'gs://exam-past-question.appspot.com/');
// ignore: unused_element
FirebaseFirestore firestore = FirebaseFirestore.instance;
