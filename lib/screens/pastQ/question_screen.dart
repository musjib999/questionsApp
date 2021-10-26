import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/pastQ/unavailableCourses_screen.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/themes/colors.dart';
import 'package:screenshot/screenshot.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({required this.courseTitle, required this.questionUrl});
  final String courseTitle;
  final String questionUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$courseTitle'),
        backgroundColor: AppColors.primaryDarkAsh,
        actions: [
          IconButton(
            onPressed: () =>
                pastQservice.screenshotService.screenshotAndRoute(context),
            icon: Icon(Icons.share),
            tooltip: 'Share',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: QuestionPdf(
          questionUrl: '$questionUrl',
        ),
      ),
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Screenshot(
              controller: screenshotController,
              child: PDFViewer(
                document: doc,
                pickerButtonColor: Color(0xff445B83),
                zoomSteps: 3,
              ),
            ),
    );
  }
}
