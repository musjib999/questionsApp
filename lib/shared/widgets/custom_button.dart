import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onTap;

  CustomBotton({required this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff445B83),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2.5),
              blurRadius: 5,
              color: Color(0xff445B83).withOpacity(0.3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
