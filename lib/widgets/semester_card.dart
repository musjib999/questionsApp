import 'package:flutter/material.dart';
import 'package:pastq/constants.dart';

class SemesterCard extends StatelessWidget {
  SemesterCard({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Color(0xff445B83),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff445B83).withOpacity(0.5),
            offset: Offset(0, 2.5),
            spreadRadius: 3,
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: kCardTextStyle,
        ),
      ),
    );
  }
}
