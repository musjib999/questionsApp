import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastq/screens/unavailableCourses_screen.dart';
import 'package:pastq/core/services/database_service.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({@required this.docId});
  final docId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: DatabaseService().getQuestion(docId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text(
            "Document does not exist",
            style: TextStyle(color: Colors.red, fontSize: 20),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text('${data['title']}'),
              backgroundColor: Color(0xff445B83),
            ),
            body: QuestionPdf(
              questionUrl: '${data['question']}',
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Loading...'),
            backgroundColor: Color(0xff445B83),
          ),
          body: Center(
            child: CircularProgressIndicator(
              color: Color(0xff445B83),
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class QuestionPdf extends StatefulWidget {
  QuestionPdf({required this.questionUrl});
  String questionUrl;
  @override
  _QuestionPdfState createState() => _QuestionPdfState();
}

class _QuestionPdfState extends State<QuestionPdf> {
  bool isLoading = false;
  late PDFDocument doc;

  void initState() {
    super.initState();
    getQuestionPdf();
    // _delayTime();
  }

  void errorPage() {
    Navigator.pushNamed(context, NoCoursesPage.id);
  }

  void getQuestionPdf() async {
    try {
      setState(() {
        isLoading = true;
      });

      doc = await PDFDocument.fromURL(widget.questionUrl);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Err >>> $e');
    }
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
              pickerButtonColor: Color(0xff445B83),
              zoomSteps: 3,
            ),
    );
  }
}


//  if (!snapshot.hasData) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Loading...'),
//               backgroundColor: Color(0xff445B83),
//             ),
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('${snapshot.data}'),
//             backgroundColor: Color(0xff445B83),
//           ),
//           // body: QuestionPdf(
//           //   questionUrl: '${snapshot.data}',
//           // ),
//         );
//       },