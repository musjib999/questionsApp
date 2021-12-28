import 'dart:async';
import 'dart:io';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/core/services/utility_service.dart';
import 'package:pastq/shared/global/config.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/models/course_model.dart';

class DatabaseService {
  Future<List<CourseModel>> getQuestionSuggestion(String query) async {
    List snapshot = depertment == depertments[0]
        ? await pastQservice.firestoreService
            .getAllDoc(collection: 'General Studies and Enterpreneurship')
        : await pastQservice.firestoreService.getAllDocInCollection(
            firstCollection: depertment,
            documentId: level,
            secondCollection: semester,
            year: selectedYear);
    List suggestion = snapshot;
    return suggestion
        .map((json) => CourseModel.fromJson(json.data()))
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
