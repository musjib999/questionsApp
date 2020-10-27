import 'package:flutter/material.dart';
import 'package:pastQ/constants.dart';

class SemesterCard extends StatelessWidget {
  SemesterCard({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.0,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xff445B83),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff445B83).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
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
