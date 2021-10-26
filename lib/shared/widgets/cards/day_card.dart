import 'package:flutter/material.dart';
import 'package:pastq/shared/themes/colors.dart';

class DateTile extends StatelessWidget {
  final String weekDay;
  final bool isSelected;
  DateTile({required this.weekDay, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white54),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            weekDay,
            style: TextStyle(
              color: isSelected ? AppColors.primaryDarkAsh : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
