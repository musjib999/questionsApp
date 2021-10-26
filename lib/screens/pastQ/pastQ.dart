import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:pastq/shared/widgets/cards/depertment_card.dart';

import 'courses_screen.dart';
import 'levels_screen.dart';

class PastQ extends StatefulWidget {
  const PastQ({Key? key}) : super(key: key);

  @override
  _PastQState createState() => _PastQState();
}

class _PastQState extends State<PastQ> {
  List<Widget> departmentWidget = [
    Center(
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Hi, what question are you looking for?',
              speed: const Duration(milliseconds: 80),
              textStyle: TextStyle(color: Colors.white),
            ),
          ],
          displayFullTextOnTap: true,
        ),
      ),
    ),
    SizedBox(
      height: 8.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
        future: pastQservice.persistenceStorageservice
            .readJson('assets/json/department.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No Data!'),
            );
          }
          final payload = snapshot.data;

          for (final department in payload) {
            String name = department['name'];
            String svg = department['svg'];
            final departmentCard = GestureDetector(
              child: DepertmentCard(
                color: Colors.white,
                title: name,
                icon: svg,
              ),
              onTap: () {
                depertment = name;

                pastQservice.routerService.nextRoute(
                  context,
                  name == 'General Studies And Entrepreneurship'
                      ? CoursesPage(
                          depertment: name,
                        )
                      : LevelPage(name),
                );
              },
            );

            departmentWidget.add(departmentCard);
          }
          return ListView(
            children: departmentWidget,
          );
        },
      ),
    );
  }
}
