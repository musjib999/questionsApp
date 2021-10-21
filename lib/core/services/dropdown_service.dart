import 'package:flutter/material.dart';
import 'package:pastq/shared/global/global_var.dart';

dynamic selectedYear = '2019';

class DropDownHelper {
  String selectedDepertment = '';
  String selectedLevel = '';
  String selectedSemester = '';

  List<String> category = [
    'Study',
    'Prepare for a test',
    'Prepare for Examination'
  ];

  List<String> year = ['2016', '2017', '2018', '2019'];
  List<String> levels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];
  List<String> semesters = ['First Semester', 'Second Semester'];

  List<DropdownMenuItem> getReminderCategoryDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String item in category) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getYearDropdownItems() {
    List<DropdownMenuItem> dropdowmItems = [];

    for (String item in year) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getDepertmentDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String depertment in depertments) {
      var newItem =
          DropdownMenuItem(child: Text(depertment), value: depertment);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getLevelDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String level in levels) {
      var newItem = DropdownMenuItem(child: Text(level), value: level);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<DropdownMenuItem> getSemesterDropdownItems() {
    List<DropdownMenuItem<String>> dropdowmItems = [];

    for (String semester in semesters) {
      var newItem = DropdownMenuItem(child: Text(semester), value: semester);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }
}
