import 'package:flutter/material.dart';

class AppointmentResult {
  DateTime dateTime;
  int exp;
  AppointmentResult(this.dateTime, this.exp);

  bool isAttend() {
    return exp > 0;
  }
}

class Data {
  static List<AppointmentResult> _data = [
    AppointmentResult(DateTime(2023, 3, 6), 0),
    AppointmentResult(DateTime(2023, 3, 5), 100),
    AppointmentResult(DateTime(2023, 3, 4), 90),
    AppointmentResult(DateTime(2023, 3, 3), 90),
    AppointmentResult(DateTime(2023, 3, 2), 60),
    AppointmentResult(DateTime(2023, 3, 1), 20),
    AppointmentResult(DateTime(2023, 2, 28), 200),
    AppointmentResult(DateTime(2023, 2, 27), 20),
    AppointmentResult(DateTime(2023, 2, 26), 0),
    AppointmentResult(DateTime(2023, 2, 25), 10),
    AppointmentResult(DateTime(2023, 2, 24), 122),
    AppointmentResult(DateTime(2023, 2, 23), 200),
    AppointmentResult(DateTime(2023, 2, 22), 10),
    AppointmentResult(DateTime(2023, 2, 21), 100),
    AppointmentResult(DateTime(2023, 2, 20), 15),
    AppointmentResult(DateTime(2023, 2, 19), 20),
    AppointmentResult(DateTime(2023, 2, 18), 200),
    AppointmentResult(DateTime(2023, 2, 17), 150),
    AppointmentResult(DateTime(2023, 2, 16), 80),
    AppointmentResult(DateTime(2023, 2, 15), 50),
    AppointmentResult(DateTime(2023, 2, 14), 80),
    AppointmentResult(DateTime(2023, 2, 13), 40),
    AppointmentResult(DateTime(2023, 2, 12), 50),
    AppointmentResult(DateTime(2023, 2, 11), 150),
    AppointmentResult(DateTime(2023, 2, 10), 400),
    AppointmentResult(DateTime(2023, 2, 9), 100),
    AppointmentResult(DateTime(2023, 2, 8), 100),
    AppointmentResult(DateTime(2023, 2, 7), 150),
    AppointmentResult(DateTime(2023, 2, 6), 10),
    AppointmentResult(DateTime(2023, 2, 5), 0),
    AppointmentResult(DateTime(2023, 2, 4), 0),
    AppointmentResult(DateTime(2023, 2, 3), 0),
    AppointmentResult(DateTime(2023, 2, 2), 0),
    AppointmentResult(DateTime(2023, 2, 1), 25),
    AppointmentResult(DateTime(2023, 1, 31), 75),
    AppointmentResult(DateTime(2023, 1, 30), 150),
    AppointmentResult(DateTime(2023, 1, 29), 10),
    AppointmentResult(DateTime(2023, 1, 28), 20),
    AppointmentResult(DateTime(2023, 1, 27), 0),
    AppointmentResult(DateTime(2023, 1, 26), 200),
    AppointmentResult(DateTime(2023, 1, 25), 0),
    AppointmentResult(DateTime(2023, 1, 24), 0),
    AppointmentResult(DateTime(2023, 1, 23), 0),
    AppointmentResult(DateTime(2023, 1, 22), 0),
    AppointmentResult(DateTime(2023, 1, 21), 0),
    AppointmentResult(DateTime(2023, 1, 20), 0),
    AppointmentResult(DateTime(2023, 1, 19), 0),
    AppointmentResult(DateTime(2023, 1, 18), 0),
    AppointmentResult(DateTime(2023, 1, 17), 0),
    AppointmentResult(DateTime(2023, 1, 16), 0),
    AppointmentResult(DateTime(2023, 1, 15), 0),
    AppointmentResult(DateTime(2023, 1, 14), 0),
    AppointmentResult(DateTime(2023, 1, 13), 0),
  ];

  static List<AppointmentResult> getData() {
    return _data;
  }

  static DateTime now = DateTime.now();
  static List<AppointmentResult> getDataAtDay(DateTime dateTime) {
    List<AppointmentResult> result = [];
    for (var element in _data) {
      if (dateTime.year == element.dateTime.year &&
          dateTime.day == element.dateTime.day &&
          dateTime.month == element.dateTime.month) {
        result.add(element);
        //debugPrint("${element.exp}");
      }
    }
    return result;
  }

  static List<AppointmentResult> getDataAtWeek(DateTime dateTime) {
  List<AppointmentResult> result = [];
  DateTime startOfWeek = dateTime.subtract(Duration(days: dateTime.weekday - 1));             //หาวันแรกของสัปดาห์
  DateTime endOfWeek = dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday + 1)); //หาวันสุดท้ายของสัปดาห์

  for (DateTime date = startOfWeek; date.isBefore(endOfWeek); date = date.add(Duration(days: 1))) { //date.isBefore(endOfWeek) startOfWeek ถึง endOfWeek
    List<AppointmentResult> dataAtDay = getDataAtDay(date);
    for (var element in dataAtDay) {
      result.add(element);
    }
  }
  debugPrint("result = $result");
  return result;
  }

  static List<AppointmentResult> getDataAtMonth(DateTime dateTime) {
  List<AppointmentResult> result = [];
  for (var element in _data) {
    if (dateTime.year == element.dateTime.year &&
        dateTime.month == element.dateTime.month) {
      result.add(element);
    }
  }
  return result;
  }

  static List<int> getExpValuesAtDay(DateTime dateTime) {
    List<int> expValues = [];
    int sum = 0;
    for (var element in _data) {
      if (dateTime.year == element.dateTime.year &&
          dateTime.day == element.dateTime.day &&
          dateTime.month == element.dateTime.month) {
          sum += element.exp;
        //expValues.add(element.exp);
      }
    }
    expValues.add(sum);
    return expValues;
  }

  static List<int> getExpValuesAtWeek(DateTime dateTime) {
  List<int> expValues = [];
  int sum = 0;
  DateTime startOfWeek = dateTime.subtract(Duration(days: dateTime.weekday - 1));             //หาวันแรกของสัปดาห์
  DateTime endOfWeek = dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday+1)); //หาวันสุดท้ายของสัปดาห์

  for (DateTime date = startOfWeek; date.isBefore(endOfWeek); date = date.add(Duration(days: 1))) { //date.isBefore(endOfWeek) startOfWeek ถึง endOfWeek
    List<AppointmentResult> dataAtDay = getDataAtDay(date);
    for (var element in dataAtDay) {
      sum += element.exp;
      //expValues.add(element.exp);
    }
  }
  expValues.add(sum);
  return expValues;
  }

  static List<int> getExpValuesAtMonth(DateTime dateTime) {
  List<int> expValues = [];
  int sum = 0;
  DateTime startOfMonth = DateTime(dateTime.year, dateTime.month, 1);                               //หาวันแรกของเดือน
  DateTime endOfMonth = DateTime(dateTime.year, dateTime.month + 1, 1).subtract(Duration(days: 1)); //หาวันสุดท้ายของเดือน

  for (DateTime date = startOfMonth; date.isBefore(endOfMonth); date = date.add(Duration(days: 1))) { 
    List<AppointmentResult> dataAtDay = getDataAtDay(date);
    for (var element in dataAtDay) {
      sum += element.exp;
    }
  }
  expValues.add(sum);
  return expValues;
  }

  // 1
  // // static double getSuccessRateAtDay(DateTime dateTime) {
  // // List<AppointmentResult> results = getDataAtDay(dateTime);
  // // if (results.isEmpty) {
  // //   return 0;
  // // }
  // // int totalAppointments = results.length;
  // // int attendedAppointments = results.where((element) => element.isAttend()).length;
  // // return attendedAppointments / totalAppointments;
  // // }
  
  // static List<double> maxEXPLv = [0, 200, 400, 600, 800, 1000];
  // static double getSuccessRateAtDay(DateTime dateTime) {
  // List<int> exp = getExpValuesAtDay(dateTime);
  // late double results;
  // int ans = 0;
  // if (exp.isEmpty) {
  //   return 0;
  // } else {
  //   // results = (exp[0].toDouble() / maxEXPLv[1]);
  //   for (var element in exp) {
  //     results = (element / maxEXPLv[1]);
  //     //debugPrint("${dateTime}    ${getDataAtWeek(dateTime)}");
  //   }
  //   for (var element in getDataAtWeek(dateTime)) {
  //     //debugPrint("${dateTime}    ${getDataAtWeek(dateTime)}");
  //     debugPrint("${element.dateTime}");
  //     ans += element.exp;
  //     debugPrint("ans = $ans");
  //   }
  //   return results;
  // }
  // }
  
  // static double getSuccessRateAtWeek(DateTime dateTime) {
  // List<int> expValues = [];
  // int sum = 0;
  // late double results;
  // DateTime startOfWeek = dateTime.subtract(Duration(days: dateTime.weekday - 1));             //หาวันแรกของสัปดาห์
  // DateTime endOfWeek = dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday)); //หาวันสุดท้ายของสัปดาห์

  // for (DateTime date = startOfWeek; date.isBefore(endOfWeek); date = date.add(Duration(days: 1))) { //date.isBefore(endOfWeek) startOfWeek ถึง endOfWeek
  //   List<AppointmentResult> dataAtDay = getDataAtDay(date);
  //   for (var element in dataAtDay) {
  //     sum += element.exp;
  //     //expValues.add(element.exp);
  //   }
  // }
  // results = 0;
  // expValues.add(sum);
  // return results;
  // }

  static double getSuccessRateAtDay(DateTime dateTime) {
  List<AppointmentResult> results = getDataAtDay(dateTime);
  if (results.isEmpty) {
    return 0;
  }
  int totalAppointments = results.length;
  //int attendedAppointments = results.where((element) => element.isAttend()).length;
  int attendedAppointments = results.where((element) {
    return element.isAttend();              //เช็คว่า element ที่เป็น AppointmentResult > 0 ไหม
  }).length;
  return attendedAppointments / totalAppointments;
  }

  static double getSuccessRateAtWeek(DateTime dateTime) {
  List<AppointmentResult> results = getDataAtWeek(dateTime);
  if (results.isEmpty) {
    return 0;
  }
  int totalAppointments = results.length;
  int attendedAppointments = results.where((element) {
    return element.isAttend();              //เช็คว่า element ที่เป็น AppointmentResult > 0 ไหม
  }).length;
  return attendedAppointments / totalAppointments;
  }

  static double getSuccessRateAtMonth(DateTime dateTime) {
  List<AppointmentResult> results = getDataAtMonth(dateTime);
  if (results.isEmpty) {
    return 0;
  }
  int totalAppointments = results.length;
  int attendedAppointments = results.where((element) {
    return element.isAttend();              //เช็คว่า element ที่เป็น AppointmentResult > 0 ไหม
  }).length;
  return attendedAppointments / totalAppointments;
  }

// List<TimeData> chartData = [];
//     DateTime now = DateTime.now();
//     if (thisChartType1 == ChartType.day) {
//         for (int i = 6; i >= 0; i--) {
//           DateTime date = now.subtract(Duration(days: i));
//           double value = values[i];
//           chartData.add(TimeData(date, value));
//         }
//     } if (thisChartType1 == ChartType.week) {
//         for (int i = 6,timecheck = 42; i >= 0; i--) {
//           DateTime date = now.subtract(Duration(days: timecheck));
//           double value = values[i * 7];
//           chartData.add(TimeData(date, value));
//           timecheck = timecheck - 7;
//         }
//     } if (thisChartType1 == ChartType.month) {
//         for (int i = 6,timecheck = 180; i >= 0; i--) {
//           DateTime date = now.subtract(Duration(days: timecheck));
//           double value = values[i];
//           chartData.add(TimeData(date, value));
//           timecheck = timecheck - 30;
//         }
//     }




  // static saveData() {
  //   //TODO:@nepumi commit in firebase
  // }

  // static loadData() {
  //   //TODO:@nepumi pull from firebase
  //   _data = [
  //     AppointmentResult(DateTime(2023, 2, 23), 200),
  //     AppointmentResult(DateTime(2023, 2, 23), 17),
  //     AppointmentResult(DateTime(2023, 2, 21), 17),
  //   ];
  // }
}
