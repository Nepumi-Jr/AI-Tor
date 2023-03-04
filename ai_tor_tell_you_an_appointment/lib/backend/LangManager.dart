//? Bottom Bar
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BottomBarLangData {
  final String home;
  final String calendar;
  final String statistic;
  final String setting;

  BottomBarLangData(
      {required this.home,
      required this.calendar,
      required this.statistic,
      required this.setting});
}

//? Home Page
class HomePageLangData {
  final String levelFormat; //! 1: Level, 2: exp, 3:max exp of that level
  final String
      percentFormat; // ! 1:String Percent as Integer range from 0 to 100 (Not including %)

  final String commentHappy;
  final String commentNormal;
  final String commentSad;
  final String commentAngry;
  final String commentDead;

  final String dropDownDate;
  final String dropDownPriority;

  final String tilesActivity;
  final String tilesLocation;
  final String tilesTime;

  HomePageLangData(
      {required this.levelFormat,
      required this.percentFormat,
      required this.commentHappy,
      required this.commentNormal,
      required this.commentSad,
      required this.commentAngry,
      required this.commentDead,
      required this.dropDownDate,
      required this.dropDownPriority,
      required this.tilesActivity,
      required this.tilesLocation,
      required this.tilesTime});
}

//? Calendar Page
class CalendarPageLangData {
  final String alertMoreDetail;
  final String alertClose;

  CalendarPageLangData(
      {required this.alertMoreDetail, required this.alertClose});
}

//? Info Page
class InfoPageLangData {
  final String alertTimeFormat; //! 1: string of time duration

  InfoPageLangData({required this.alertTimeFormat});
}

//? Setting Page
class SettingPageLangData {
  final String menuColor;
  final String menuFaceImage;

  final String logout;

  //? color theme
  final String colorTitle;
  final String colorToneTitle;
  final String colorLightTheme;
  final String colorDarkTheme;
  final String colorConfirm;
  final String colorWarning;

  //? Face Image
  final String faceTitle;
  final String faceHappyImage;
  final String faceNormalImage;
  final String faceSadImage;
  final String faceAngryImage;
  final String faceDeadImage;
  final String faceCropperTitle;

  SettingPageLangData({
    required this.menuColor,
    required this.menuFaceImage,
    required this.logout,
    required this.colorTitle,
    required this.colorToneTitle,
    required this.colorLightTheme,
    required this.colorDarkTheme,
    required this.colorConfirm,
    required this.colorWarning,
    required this.faceTitle,
    required this.faceHappyImage,
    required this.faceNormalImage,
    required this.faceSadImage,
    required this.faceAngryImage,
    required this.faceDeadImage,
    required this.faceCropperTitle,
  });
}

class StructLangData {
  final BottomBarLangData bottom;
  final HomePageLangData home;
  final CalendarPageLangData calendar;
  final InfoPageLangData info;
  final SettingPageLangData setting;

  StructLangData(
      {required this.bottom,
      required this.home,
      required this.calendar,
      required this.info,
      required this.setting});
}

class ENLangData {
  StructLangData getData() {
    return StructLangData(
      bottom: BottomBarLangData(
          home: "Home",
          calendar: "Calendar",
          statistic: "Statistic",
          setting: "Setting"),
      home: HomePageLangData(
          levelFormat: "Level %{1} (%{2}/%{3})",
          percentFormat: "Accuracy %{1}%",
          commentHappy: "Yeah! Keep Going!",
          commentNormal: "Keep Going!",
          commentSad: "Oh no...",
          commentAngry: ":(",
          commentDead: "VERY BAD!!",
          dropDownDate: "Date",
          dropDownPriority: "Priority",
          tilesActivity: "Activity",
          tilesLocation: "Location",
          tilesTime: "Time"),
      calendar: CalendarPageLangData(
          alertMoreDetail: "More Detail", alertClose: "Close"),
      info: InfoPageLangData(alertTimeFormat: "%{1} before"),
      setting: SettingPageLangData(
          menuColor: "Color Theme",
          menuFaceImage: "Face Image",
          logout: "Logout",
          colorTitle: "Color Theme",
          colorToneTitle: "Tone of Theme",
          colorLightTheme: "Light Theme",
          colorDarkTheme: "Dark Theme",
          colorConfirm: "Confirm",
          colorWarning: "Not recommended for your color theme",
          faceTitle: "Face Image Setting",
          faceHappyImage: "Happy face",
          faceNormalImage: "Normal face",
          faceSadImage: "Sad face",
          faceAngryImage: "Angry face",
          faceDeadImage: "Dead face",
          faceCropperTitle: "Cropper"),
    );
  }
}

class THLangData {
  StructLangData getData() {
    return StructLangData(
      bottom: BottomBarLangData(
          home: "หน้าหลัก",
          calendar: "ปฏิธิน",
          statistic: "กราฟ",
          setting: "การตั้งค่า"),
      home: HomePageLangData(
          levelFormat: "ระดับ %{1} (%{2}/%{3})",
          percentFormat: "คิดเป็น %{1}%",
          commentHappy: "ยินดีด้วย! คุณได้ทำได้ดีมาก!",
          commentNormal: "คุณได้ทำได้ดี!",
          commentSad: "เสียใจด้วย...",
          commentAngry: ":(",
          commentDead: "แย่มาก!!",
          dropDownDate: "วันที่",
          dropDownPriority: "ความสำคัญ",
          tilesActivity: "กิจกรรม",
          tilesLocation: "สถานที่",
          tilesTime: "เวลา"),
      calendar: CalendarPageLangData(
          alertMoreDetail: "รายละเอียดเพิ่มเติม", alertClose: "ปิด"),
      info: InfoPageLangData(alertTimeFormat: "%{1}ก่อนกิจกรรม"),
      setting: SettingPageLangData(
          menuColor: "สีของแอพ",
          menuFaceImage: "รูปภาพใบหน้า",
          logout: "ออกจากระบบ",
          colorTitle: "สีของแอพ",
          colorToneTitle: "โทนของแอพ",
          colorLightTheme: "โทนสว่าง",
          colorDarkTheme: "โทนมืด",
          colorConfirm: "ยืนยัน",
          colorWarning: "ไม่แนะนำให้ใช้สีนี้กับโทนของแอพ",
          faceTitle: "การตั้งค่ารูปภาพใบหน้า",
          faceHappyImage: "หน้ายิ้ม",
          faceNormalImage: "หน้าปกติ",
          faceSadImage: "หน้าเศร้า",
          faceAngryImage: "หน้าโกรธ",
          faceDeadImage: "หน้าตาย",
          faceCropperTitle: "ตัดรูป"),
    );
  }
}

class LangMan {
  static bool _isInit = false;
  static String selectedLang = "en";
  static late StructLangData data;

  static void _loadString() {
    //get selected language by phone language
    //if not found, use english
    List<Locale> currentSystemLocales = WidgetsBinding.instance.window.locales;
    const List<String> avaliableLang = ["en", "th"];

    for (Locale locale in currentSystemLocales) {
      debugPrint(">>>>>> ${locale.languageCode}");
      if (avaliableLang.contains(locale.languageCode)) {
        selectedLang = locale.languageCode;
        break;
      }
      //? Todo: add more language
    }

    if (selectedLang == "en") {
      data = ENLangData().getData();
    } else if (selectedLang == "th") {
      data = THLangData().getData();
    } else {
      data = ENLangData().getData();
    }

    debugPrint(">>>>>> ${data.bottom.setting}");
    _isInit = true;
  }

  static StructLangData get() {
    if (!_isInit) {
      _loadString();
    }

    return data;
  }

  static String interpolate(String string, List<Object> params) {
    //? Idea from random stack overflow (Phill Wiggins)
    String result = string;
    for (int i = 0; i < params.length; i++) {
      result = result.replaceAll('%{${i + 1}}', params[i].toString());
    }

    return result;
  }
}
