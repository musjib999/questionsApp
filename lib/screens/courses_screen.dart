import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastq/helpers/dropdown_helper.dart';
import 'package:pastq/screens/question_screen.dart';
import 'package:pastq/services/courses.dart';
import 'package:pastq/services/databaseService.dart';

class CoursesPage extends StatefulWidget {
  static String id = 'courses';

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  DropDownHelper _dropDownHelper = DropDownHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$semester'),
        backgroundColor: Color(0xff445B83),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.calendar_today,
          //     color: Colors.white,
          //   ),
          //   onPressed: null,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton(
              items: _dropDownHelper.getYearDropdownItems(),
              onChanged: (value) {
                setState(() {
                  selectedYear = value;
                });
                print(selectedYear);
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              underline: Container(),
            ),
          ),
        ],
      ),
      body: CoursesStreamBuilder(),
    );
  }
}

class CoursesStreamBuilder extends StatefulWidget {
  @override
  _CoursesStreamBuilderState createState() => _CoursesStreamBuilderState();
}

class _CoursesStreamBuilderState extends State<CoursesStreamBuilder> {
  DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _databaseService.getPastQuestionYear(selectedYear),
      // stream: _firestore
      //     .collection(
      //         level == 'Level 1' ? depertment = depertments[0] : depertment)
      //     .document(level)
      //     .collection(semester)
      //     .where("year", isEqualTo: "${_dropDownHelper.selectedYear}")
      //     .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final documents = snapshot.data.documents;
        List<Widget> coursesTitleWidgets = [];
        for (var title in documents) {
          final courseTitle = title.data['title'];
          final courseCode = title.data['courseCode'];
          // print(courseTitle);
          final documentId = title.documentID;
          final courseTitleWidget = ListTile(
            title: Text('$courseTitle'),
            subtitle: Text('$courseCode'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QuestionPage(
                      docId: documentId,
                    );
                  },
                ),
              );
            },
          );
          coursesTitleWidgets.add(courseTitleWidget);
        }
        return ListView(
          children: coursesTitleWidgets,
        );
      },
    );
  }
}

// void _showDialog() {
//                             showDialog<int>(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return NumberPickerDialog.integer(
//                                   initialIntegerValue:
//                                       (_currentPage != null) ? _currentPage : 1,
//                                   minValue: 1,
//                                   maxValue: research.data['research']['nPages'],
//                                   // onChanged: (value) {

//                                   // },
//                                 );
//                               },
