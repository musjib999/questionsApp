import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pastq/shared/themes/colors.dart';

class UtilityService {
  Future<File?> cropImage(String imagePath) async {
    return await ImageCropper.cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: AppColors.secondaryDarkAsh,
        toolbarWidgetColor: Colors.white,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(minimumAspectRatio: 1.0),
    );
  }
}
