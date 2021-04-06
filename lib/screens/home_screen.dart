import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pastq/screens/levels_screen.dart';
import 'package:pastq/widgets/depertment_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pastq/services/depertment.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Questions'),
        backgroundColor: Color(0xff445B83),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12.0),
              child: TyperAnimatedTextKit(
                text: ['Hi, what question are you looking for?'],
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            GestureDetector(
              child: DepertmentCard(
                color: Color(0xff0597dc),
                title: depertments[0],
                icon: Icons.code,
                boxShadowColor: Color(0xff0597dc).withOpacity(0.5),
              ),
              onTap: () {
                Navigator.pushNamed(context, LevelPage.id);
                depertment = depertments[0];
              },
            ),
            GestureDetector(
              child: DepertmentCard(
                color: Color(0xff516696),
                title: depertments[1],
                icon: FontAwesomeIcons.laptop,
                boxShadowColor: Color(0xff516696).withOpacity(0.5),
              ),
              onTap: () {
                Navigator.pushNamed(context, LevelPage.id);
                depertment = depertments[1];
              },
            ),
            GestureDetector(
              child: DepertmentCard(
                color: Color(0xff1e70eb),
                title: depertments[2],
                icon: FontAwesomeIcons.lock,
                boxShadowColor: Color(0xff1e70eb).withOpacity(0.5),
              ),
              onTap: () {
                Navigator.pushNamed(context, LevelPage.id);
                depertment = depertments[2];
              },
            ),
            GestureDetector(
              child: DepertmentCard(
                color: Color(0xff9677EF),
                title: depertments[3],
                icon: FontAwesomeIcons.chartLine,
                boxShadowColor: Color(0xff9677EF).withOpacity(0.5),
              ),
              onTap: () {
                Navigator.pushNamed(context, LevelPage.id);
                depertment = depertments[3];
              },
            ),
          ],
        ),
      ),
    );
  }
}
