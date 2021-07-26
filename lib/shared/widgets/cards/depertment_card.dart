import 'package:flutter/material.dart';
import 'package:pastq/shared/themes/constants.dart';

class DepertmentCard extends StatelessWidget {
  DepertmentCard(
      {required this.title,
      required this.icon,
      required this.color,
      this.boxShadowColor});
  final IconData icon;
  final String title;
  final Color color;
  final Color? boxShadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor!.withOpacity(0.15),
            offset: Offset(0, 2.5),
            spreadRadius: 3,
            blurRadius: 5,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kCardTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
