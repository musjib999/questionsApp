import 'dart:convert';

import 'package:flutter/services.dart';

class PersistenceStorageservice {
  Future readJson(String jsonFilePath) async {
    final String response = await rootBundle.loadString(jsonFilePath);
    final data = await json.decode(response);
    return data;
    // ...
  }
}
