import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class PersistenceStorageservice {
  Future readJson(String jsonFilePath) async {
    final String response = await rootBundle.loadString(jsonFilePath);
    final data = await json.decode(response);
    return data;
  }

  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }
}
