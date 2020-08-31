import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:questions_app/utilities/depertment_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:questions_app/services/depertment.dart';


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
      body: ListView(
        scrollDirection: Axis.vertical,
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: null,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: DepertmentCard(
              color: Color(0xff0597dc),
              title: depertments[0],
              icon: Icons.code,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'level');
              depertment = depertments[0];
            },
          ),
          GestureDetector(
            child: DepertmentCard(
              color: Color(0xff516696),
              title: depertments[1],
              icon: FontAwesomeIcons.laptop,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'level');
              depertment = depertments[1];
            },
          ),
          GestureDetector(
            child: DepertmentCard(
              color: Color(0xffFE8656),
              title: depertments[2],
              icon: FontAwesomeIcons.lock,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'level');
              depertment = depertments[2];
            },
          ),
          GestureDetector(
            child: DepertmentCard(
              color: Color(0xff9677EF),
              title: depertments[3],
              icon: FontAwesomeIcons.chartLine,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'level');
              depertment = depertments[3];
            },
          ),
        ],
      ),
    );
  }
}
