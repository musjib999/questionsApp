import 'package:flutter/material.dart';

String selectedYear = '2019';

class DropDownHelper {
  String selectedDepertment = '';

  List<String> category = [
    'Study',
    'Prepare for a test',
    'Prepare for Examination'
  ];

  List<DropdownMenuItem> getReminderCategoryDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String item in category) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<String> year = ['2021', '2019'];

  List<DropdownMenuItem> getYearDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String item in year) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }
}
