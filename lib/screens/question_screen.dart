import 'package:flutter/material.dart';
import 'package:pastq/screens/unavailableCourses_screen.dart';
import 'package:pastq/services/databaseService.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({@required this.docId});
  final docId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService().getQuestion(docId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Loading...'),
              backgroundColor: Color(0xff445B83),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('${snapshot.data['title']}'),
            backgroundColor: Color(0xff445B83),
          ),
          body: QuestionPdf(
            questionUrl: '${snapshot.data['question']}',
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class QuestionPdf extends StatefulWidget {
  QuestionPdf({this.questionUrl});
  String questionUrl;
  @override
  _QuestionPdfState createState() => _QuestionPdfState();
}

class _QuestionPdfState extends State<QuestionPdf> {
  bool isLoading;
  PDFDocument doc;

  void initState() {
    super.initState();
    getQuestionPdf();
    // _delayTime();
  }

  void errorPage() {
    Navigator.pushNamed(context, NoCoursesPage.id);
  }

  void getQuestionPdf() async {
    setState(() {
      isLoading = true;
    });

    doc = await PDFDocument.fromURL(widget.questionUrl);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: doc,
            ),
    );
  }
}
