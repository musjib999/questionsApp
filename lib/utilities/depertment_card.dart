import 'package:flutter/material.dart';
import 'package:questions_app/constants.dart';

class DepertmentCard extends StatelessWidget {
  DepertmentCard({this.title, this.icon, this.color});
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 79.0,
            height: 79.0,
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
              size: 40.0,
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
