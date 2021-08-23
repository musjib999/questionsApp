import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/courses_screen.dart';
import 'package:pastq/screens/levels_screen.dart';
import 'package:pastq/screens/upload_screen.dart';
import 'package:pastq/shared/globals/global_var.dart';
import 'package:pastq/shared/widgets/cards/depertment_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
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
              SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                child: DepertmentCard(
                  color: Colors.white,
                  title: depertments[0],
                  icon: 'assets/svg/gsp.svg',
                  boxShadowColor: Colors.green.withOpacity(0.5),
                ),
                onTap: () {
                  depertment = depertments[0];

                  pastQservice.routerService.nextRoute(
                      context,
                      CoursesPage(
                        depertment: depertments[0],
                      ));
                },
              ),
              GestureDetector(
                child: DepertmentCard(
                  color: Color(0xff0597dc),
                  title: depertments[1],
                  icon: 'assets/svg/swe.svg',
                  boxShadowColor: Color(0xff0597dc).withOpacity(0.5),
                ),
                onTap: () {
                  depertment = depertments[1];
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LevelPage(depertments[1]);
                  }));
                },
              ),
              GestureDetector(
                child: DepertmentCard(
                  color: Color(0xff516696),
                  title: depertments[2],
                  icon: 'assets/svg/csc.svg',
                  boxShadowColor: Color(0xff516696).withOpacity(0.5),
                ),
                onTap: () {
                  depertment = depertments[2];

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LevelPage(depertments[2]);
                  }));
                },
              ),
              GestureDetector(
                child: DepertmentCard(
                  color: Color(0xff1e70eb),
                  title: depertments[3],
                  icon: 'assets/svg/cbs.svg',
                  boxShadowColor: Color(0xff1e70eb).withOpacity(0.5),
                ),
                onTap: () {
                  depertment = depertments[3];
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LevelPage(depertments[3]);
                  }));
                },
              ),
              GestureDetector(
                child: DepertmentCard(
                  color: Color(0xff9677EF),
                  title: depertments[4],
                  icon: 'assets/svg/ift.svg',
                  boxShadowColor: Color(0xff9677EF).withOpacity(0.5),
                ),
                onTap: () {
                  depertment = depertments[4];
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LevelPage(depertments[4]);
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.upload_file),
        label: Text('Upload PastQ'),
        onPressed: () {
          pastQservice.routerService.nextRoute(context, Upload());
        },
      ),
    );
  }
}
