import 'package:flutter/material.dart';

class LecturesScheduleCard extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  const LecturesScheduleCard(
      {required this.color, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todays Lectures',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Elementary Mathematics III',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 8),
                    Text('8:00 am to 10:00 am')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
