import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pastq/shared/themes/colors.dart';

String selectedDepartment = '';
String selectedLevel = '';
String selectedSemester = '';
String selectedYear = '2020';

class UtilityService {
  List<DropdownMenuItem> getDropdownItems(List items) {
    List<DropdownMenuItem> dropdowmItems = [];

    for (String item in items) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

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
