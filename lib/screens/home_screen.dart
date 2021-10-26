import 'package:flutter/material.dart';
import 'package:pastq/screens/pastQ/pastQ.dart';
import 'package:pastq/shared/themes/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PastQ'),
        backgroundColor: AppColors.primaryDarkAsh,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: PastQ(),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   icon: Icon(Icons.upload_file),
      //   label: Text('Upload PastQ'),
      //   onPressed: () {
      //     pastQservice.routerService.nextRoute(context, Upload());
      //   },
      // ),
    );
  }
}
