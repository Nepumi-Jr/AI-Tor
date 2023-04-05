
import 'dart:ffi';

import '../graph/graph_data.dart';

void main() {
  print('Hello World!');
}

enum AttendStatus {
  attend,
  failed,
  notyet,
}

class User {
  int uid; 
  String name; 
  // User(this.uid, this.name);
  //List<AppointmentResult> graphData;
  User({required this.uid, required this.name});
  static  final List<Activities> _data = [];

  static int getExpAmout(DateTime dateTime) {
    List<int> activities = Data.getExpValuesAtDay(dateTime);
    int sum = 0;
    for (int i = 0; i < activities.length; i++) {
      sum += activities[i];
    }
    return sum;
  }

  static int getExp() {
    int sum = 0;
    // for (int i = 0; i < _data.length; i++) {
    //   if (_data[i].attendStatus == AttendStatus.attend) {
    //     sum += _data[i].exp;
    //   }
    // }
    for(final e in _data) {
      if (e.attendStatus == AttendStatus.attend) {
        sum += e.exp;
      }
    }
    return sum;
  }

  static double getPercentRate(DateTime dateTime) {
    return Data.getSuccessRateAtDay(dateTime);
  }

  static List<Activities> getActivities() {
    return _data;
  }
}



class Activities {
  int exp;
  String locationID;
  AttendStatus attendStatus;
  //Activities(this.exp, this.locationID);
  Activities({required this.exp, required this.locationID, required this.attendStatus});
 String getName() {
  return "displayName";
  }

  UserLocation getLocation() {
    return UserLocation(locationID: locationID, name: getName(), longtiude: 0 as Double, latitude:  0.2 as Double);
 }

  DateTime getEventTime() {
    return DateTime.now();
  }

  // AttendStatus getAttendStatus() {
  //   return attendStatus;
  // }
}

class UserLocation {
  String locationID;
  String name;
  Double longtiude;
  Double latitude;
  //UserLocation(this.locationID, this.name, this.longtiude, this.latitude);
  UserLocation({required this.locationID, required this.name, required this.longtiude, required this.latitude});
}