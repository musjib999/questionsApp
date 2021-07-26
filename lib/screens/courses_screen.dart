// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/question_screen.dart';
import 'package:pastq/core/services/dropdown_service.dart';
import 'package:pastq/screens/search_screen.dart';
import 'package:pastq/shared/globals/global_var.dart';
import 'package:pastq/core/services/database_service.dart';

class CoursesPage extends StatefulWidget {
  static String id = 'courses';

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(depertment == 'General Studies and Enterpreneurship'
            ? 'General Studies and Enterpreneurship'
            : '$semester'),
        backgroundColor: Color(0xff445B83),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<dynamic>(
              items: pastQservice.dropDownHelper.getYearDropdownItems(),
              onChanged: (value) {
                setState(() {
                  selectedYear = value;
                });
                print(selectedYear);
              },
              icon: Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
              underline: Container(),
            ),
          ),
          IconButton(
            onPressed: () {
              pastQservice.routerService.nextRoute(context, SearchScreen());
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
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
      stream: (depertment == 'General Studies and Enterpreneurship')
          ? _databaseService.getGspPastQuestionByYear(selectedYear)
          : _databaseService.getPastQuestionByYear(selectedYear),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final documents = snapshot.data!.docs;
        List<Widget> coursesTitleWidgets = [];
        for (var title in documents) {
          final courseTitle = title['title'];
          final courseCode = title['courseCode'];
          final documentId = title.id;
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
