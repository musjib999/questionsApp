import 'package:flutter/material.dart';
import 'package:questions_app/constants.dart';

class DepertmentCard extends StatelessWidget {
  DepertmentCard({this.title, this.icon, this.color, this.boxShadowColor});
  final IconData icon;
  final String title;
  final Color color;
  final Color boxShadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.only(top: 5, bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            spreadRadius: 3,
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            margin: EdgeInsets.symmetric(
              vertical: 9.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30.0,
              color: color,
            ),
          ),
          Flexible(
            child: Text(
              title,
              style: kCardTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
