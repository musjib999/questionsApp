import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pastq/shared/themes/constants.dart';

class DepertmentCard extends StatelessWidget {
  DepertmentCard({
    required this.title,
    required this.icon,
    required this.color,
  });
  final String icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
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
            child: Container(
              child: SvgPicture.asset(
                icon,
                semanticsLabel: 'Search',
                height: 30,
              ),
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
