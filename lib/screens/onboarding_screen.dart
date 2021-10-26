import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/home_screen.dart';
import 'package:pastq/screens/onbaording_page_list.dart';
import 'package:pastq/shared/themes/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          dotsDecorator: DotsDecorator(color: AppColors.primaryDarkAsh),
          pages: onboardingPages,
          onDone: () {
            pastQservice.persistenceStorageservice
                .addBoolToSF('isViewOnboardingScreen', true);
            pastQservice.routerService.popUntil(context, HomePage());
          },
          done: Text(
            'Done',
            style: TextStyle(
              color: AppColors.primaryDarkAsh,
            ),
          ),
          showNextButton: true,
          next: Text(
            'Next',
            style: TextStyle(
              color: AppColors.primaryDarkAsh,
            ),
          ),
        ),
      ),
    );
  }
}
