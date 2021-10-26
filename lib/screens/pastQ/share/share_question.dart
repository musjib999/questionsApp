import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/shared/themes/colors.dart';
import 'package:pastq/shared/widgets/buttons/primary_raised_button.dart';
import 'package:pastq/shared/widgets/forms/input_textfield.dart';

class ShareQuestion extends StatefulWidget {
  final String imagePath;
  const ShareQuestion({required this.imagePath});

  @override
  State<ShareQuestion> createState() => _ShareQuestionState();
}

class _ShareQuestionState extends State<ShareQuestion> {
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Center(
                  child: InteractiveViewer(
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                    maxScale: 5.0,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Share Question',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryDarkAsh,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        InputTextField(
                          hintText: 'subject',
                          controller: subject,
                          radius: 25.0,
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 150,
                          child: InputTextField(
                            hintText: 'body',
                            controller: body,
                            radius: 8.0,
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(height: 15),
                        PrimaryRaisedButton(
                          onTap: (startLoading, stopLoading, btnState) {
                            pastQservice.shareService
                                .shareFile(
                              widget.imagePath,
                              title: subject.text,
                              info: body.text,
                            )
                                .then((value) {
                              pastQservice.routerService.popRoute(context);
                            });
                          },
                          buttonTitle: 'Share',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
