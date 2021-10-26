import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pastq/shared/themes/colors.dart';

class PrimaryRaisedButton extends StatelessWidget {
  const PrimaryRaisedButton(
      {required this.onTap,
      required this.buttonTitle,
      this.buttonColor = AppColors.primaryDarkAsh});
  final Function(Function, Function, ButtonState) onTap;
  final String buttonTitle;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ArgonButton(
        height: 50,
        width: 200,
        borderRadius: 25.0,
        color: buttonColor,
        loader: Container(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(
            color: Colors.white,
            // size: loaderWidth ,
          ),
        ),
        onTap: onTap,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
