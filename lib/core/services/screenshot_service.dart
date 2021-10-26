import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/screens/pastQ/share/share_question.dart';
import 'package:pastq/shared/global/global_var.dart';
import 'package:path_provider/path_provider.dart';

class ScreenshotService {
  Future<String?> screenshotAndSave(BuildContext context) async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    return screenshotController.captureAndSave(
      directory,
      fileName: '$fileName.png',
      delay: Duration(milliseconds: 10),
      pixelRatio: MediaQuery.of(context).devicePixelRatio,
    );
  }

  void screenshotAndRoute(BuildContext context) {
    screenshotAndSave(context).then(
      (String? path) {
        pastQservice.utilityService.cropImage(path!).then((croppedImage) {
          pastQservice.routerService.nextRoute(
            context,
            ShareQuestion(imagePath: croppedImage!.path),
          );
        });
      },
    );
  }
}
