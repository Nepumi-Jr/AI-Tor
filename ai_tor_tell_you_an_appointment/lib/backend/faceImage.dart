import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:io' as io;
import 'package:shared_preferences/shared_preferences.dart';

const String defaultImagePath = "AYYYO**<><>)#*@^GH.DEFAULT ImAGe";

class FaceImage {
  static const int maxImage = 5;

  static List<String> fiveFilePaths = [
    for (var i = 0; i < maxImage; i++) defaultImagePath
  ];

  static List<ImageProvider> getImagesAsList() {
    return [for (var i = 0; i < maxImage; i++) getImageIndex(i)];
  }

  static ImageProvider getImageIndex(int index) {
    var thisPath = fiveFilePaths[index];
    if (thisPath == defaultImagePath) {
      //TODO: @Apichit ไปใส่รูป default ด้วย
      return NetworkImage(
          "https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg");
    } else {
      if (io.File(thisPath).existsSync()) {
        return FileImage(File(thisPath));
      } else {
        return NetworkImage(
            "https://icon-library.com/images/default-profile-icon/default-profile-icon-18.jpg");
      }
    }
  }

  static void setImagePathIndex(int index, String thisImagePath) {
    fiveFilePaths[index] = thisImagePath;

    saveSetImage();
  }

  static Future<void> saveSetImage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('setting_face_Image', fiveFilePaths);
  }

  static Future<void> loadSetImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getStringList('setting_face_Image') ?? [];
    fiveFilePaths = [
      for (var i = 0; i < maxImage; i++)
        (i < savedImage.length) ? savedImage[i] : defaultImagePath
    ];
  }
}
