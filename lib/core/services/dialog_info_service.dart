import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogInfoService {
  Future<void> showDialog({
    required String title,
    String? subtitle,
    required AlertType alertType,
    required BuildContext context,
  }) async {
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: subtitle,
      buttons: [
        DialogButton(
          color: Colors.blueGrey,
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => pastQservice.routerService.popDialog(context, false),
          width: 120,
        )
      ],
    ).show();
  }
}
