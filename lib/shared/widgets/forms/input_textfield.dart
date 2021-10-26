import 'package:flutter/material.dart';
import 'package:pastq/shared/themes/colors.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final double radius;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const InputTextField(
      {required this.hintText,
      required this.controller,
      required this.radius,
      this.validator,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.8),
            color: AppColors.secondaryDarkAsh.withOpacity(0.25),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }
}
