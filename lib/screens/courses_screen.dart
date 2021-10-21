// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/question_screen.dart';
import 'package:pastq/core/services/dropdown_service.dart';
import 'package:pastq/screens/search_screen.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/core/services/database_service.dart';

class CoursesPage extends StatefulWidget {
  static String id = 'courses';
  final String depertment;
  final String? level;
  final String? semester;

  CoursesPage({required this.depertment, this.level, this.semester});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.depertment);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.depertment == 'General Studies And Entrepreneurship'
            ? 'General Studies and Enterpreneurship'
            : '${widget.semester}'),
        backgroundColor: Color(0xff445B83),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
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
              semanticLabel: 'Search',
            ),
          ),
        ],
      ),
      body: CoursesStreamBuilder(
        depertment: widget.depertment,
        level: widget.level,
        semester: widget.semester,
      ),
    );
  }
}

class CoursesStreamBuilder extends StatefulWidget {
  final String depertment;
  final String? level;
  final String? semester;

  CoursesStreamBuilder({required this.depertment, this.level, this.semester});
  @override
  _CoursesStreamBuilderState createState() => _CoursesStreamBuilderState();
}

class _CoursesStreamBuilderState extends State<CoursesStreamBuilder> {
  DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: (widget.depertment == depertments[0])
          ? _databaseService.getGspPastQuestionByYear(selectedYear)
          : _databaseService.getPastQuestionByYear(
              deperment: widget.depertment,
              level: widget.level!,
              semester: widget.semester!,
              year: selectedYear,
            ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        final documents = snapshot.data!.docs;
        List<Widget> coursesTitleWidgets = [];
        for (var course in documents) {
          final String courseTitle = course['title'];
          final courseCode = course['courseCode'];
          final String questionUrl = course['question'];
          final courseTitleWidget = ListTile(
            title: Text(
              '$courseTitle',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '$courseCode',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QuestionPage(
                      courseTitle: courseTitle,
                      questionUrl: questionUrl,
                    );
                  },
                ),
              );
            },
          );
          coursesTitleWidgets.add(courseTitleWidget);
        }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: coursesTitleWidgets.length < 1
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'The past question you are looking for is currently not available',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                )
              : ListView(
                  children: coursesTitleWidgets,
                ),
        );
      },
    );
  }
}
