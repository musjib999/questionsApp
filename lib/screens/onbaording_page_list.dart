import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pastq/shared/themes/colors.dart';

List<PageViewModel> onboardingPages = [
  PageViewModel(
    title: "Past Questions",
    body: "Get easy access to past examination questions",
    image: Center(
      child: CircleAvatar(
        radius: 150,
        backgroundColor: AppColors.primaryDarkAsh.withOpacity(0.25),
        child: Container(
          child: SvgPicture.asset(
            'assets/svg/question.svg',
            height: 230,
          ),
        ),
      ),
    ),
  ),
  PageViewModel(
    title: "TimeTable",
    body:
        "Set timetable to automatically set phone on silent during lecture preiod",
    image: Center(
      child: CircleAvatar(
        backgroundColor: AppColors.primaryDarkAsh.withOpacity(0.25),
        radius: 150,
        child: Container(
          child: SvgPicture.asset(
            'assets/svg/time_table.svg',
            height: 230,
          ),
        ),
      ),
    ),
  ),
  PageViewModel(
    title: "Share",
    body: "Share questions with fellow students or mentor",
    image: Center(
      child: CircleAvatar(
        backgroundColor: AppColors.primaryDarkAsh.withOpacity(0.25),
        radius: 150,
        child: Container(
          child: SvgPicture.asset(
            'assets/svg/share.svg',
            height: 230,
          ),
        ),
      ),
    ),
  ),
];
