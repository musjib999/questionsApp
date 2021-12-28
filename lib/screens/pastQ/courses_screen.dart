// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/core/services/utility_service.dart';
import 'package:pastq/screens/pastQ/question_screen.dart';
import 'package:pastq/screens/pastQ/search_screen.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/models/course_model.dart';

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
  List<String> session = ['2018/19', '2020/21'];
  List<String> gspSession = ['2016/17', '2018/19', '2020/21'];

  @override
  void initState() {
    super.initState();

    widget.depertment == 'General Studies And Entrepreneurship'
        ? selectedYear = '2018'
        : selectedYear = '2020';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  widget.depertment == 'General Studies And Entrepreneurship'
                      ? gspSession[index]
                      : session[index]),
              onTap: () {
                setState(() {
                  selectedYear = widget.depertment ==
                          'General Studies And Entrepreneurship'
                      ? gspSession[index].split('/')[0]
                      : session[index].split('/')[0];
                });
                Navigator.of(context).pop();
              },
            );
          },
          itemCount: 2,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.depertment == 'General Studies And Entrepreneurship'
            ? 'General Studies and Enterpreneurship'
            : '${widget.semester}'),
        backgroundColor: Color(0xff445B83),
        actions: [
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
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
            );
          })
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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: (widget.depertment == depertments[0])
          ? pastQservice.firestoreService.getDocStream(
              collection: 'General Studies and Enterpreneurship',
              year: selectedYear)
          : pastQservice.firestoreService.getDocStreamInCollection(
              firstCollection: widget.depertment,
              documentId: widget.level!,
              secondCollection: widget.semester!,
              year: selectedYear),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        } else if (snapshot.hasError) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                SizedBox(height: 15),
                Text(
                  'There is an error!!!',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        }
        final data = snapshot.data!.docs;
        return data.isEmpty
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
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
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    CourseModel course = CourseModel(
                      title: data[index].data()['title'],
                      code: data[index].data()['courseCode'],
                      questionUrl: data[index].data()['question'],
                    );
                    return ListTile(
                      title: Text(
                        course.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        course.code,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QuestionPage(
                                courseTitle: course.title,
                                questionUrl: course.questionUrl,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  itemCount: data.length,
                ),
              );
      },
    );
  }
}
