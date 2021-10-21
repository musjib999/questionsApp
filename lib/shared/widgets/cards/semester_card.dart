import 'package:flutter/material.dart';

class SemesterCard extends StatelessWidget {
  SemesterCard({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cardBackground.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
