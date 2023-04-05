import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

const _scope = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
  'https://www.googleapis.com/auth/calendar'
];

enum AttendStatus {
  attend,
  failed,
  notyet,
  unknown,
}

class User extends ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: _scope,
  );
  late GoogleSignInAccount? user;

  int? uid;
  String? name;
  User() {
    if (Platform.isIOS) {
      _googleSignIn = GoogleSignIn(
        clientId: '980513016939-of3n4bvg8k9b47cq51gk1vuogfqkuroo',
        scopes: _scope,
      );
    }
  }
  List<Activities> _data = [];

  List<Activities> getActivities() {
    return _data;
  }

  List<Activities> getActivitiesAtDay(DateTime dateTime) {
    List<Activities> result = [];
    for (final e in _data) {
      if (e.getEventTime().day == dateTime.day &&
          e.getEventTime().month == dateTime.month &&
          e.getEventTime().year == dateTime.year) {
        result.add(e);
      }
    }
    return result;
  }

  int? getExp() {
    if (_data.isEmpty) return null;
    int sum = 0;
    for (final e in _data) {
      sum += e.exp;
    }
    return sum;
  }

  int? getExpAtDay(DateTime dateTime) {
    var dData = getActivitiesAtDay(dateTime);
    if (dData.isEmpty) return null;
    int sum = 0;
    for (final e in dData) {
      sum += e.exp;
    }
    return sum;
  }

  int? getPercentRate() {
    if (_data.isEmpty) return null;
    int allEvent = 0;
    int attendEvent = 0;
    for (final e in _data) {
      if (e.attendStatus == AttendStatus.attend ||
          e.attendStatus == AttendStatus.failed) {
        allEvent++;
      }
      if (e.attendStatus == AttendStatus.attend) {
        attendEvent++;
      }
    }
    if (allEvent == 0) {
      return null;
    }
    return 100 * attendEvent ~/ allEvent;
  }

  int? getPercentRateAtDay(DateTime dateTime) {
    var dData = getActivitiesAtDay(dateTime);
    if (dData.isEmpty) return null;
    int allEvent = 0;
    int attendEvent = 0;
    for (final e in getActivitiesAtDay(dateTime)) {
      if (e.attendStatus == AttendStatus.attend ||
          e.attendStatus == AttendStatus.failed) {
        allEvent++;
      }
      if (e.attendStatus == AttendStatus.attend) {
        attendEvent++;
      }
    }
    if (allEvent == 0) {
      return null;
    }
    return 100 * attendEvent ~/ allEvent;
  }

  void addActivities(Activities activities) {
    _data.add(activities);
    //TODO : add to database
    //TODO : add to Google calendar
    notifyListeners();
  }

  void removeActivities(String id) {
    _data.removeAt(
        _data.indexWhere((element) => element.calendarEvent.id == id));
    //TODO : add to database
    //TODO : add to Google calendar
    notifyListeners();
  }

  Future<void> doLogin() async {
    await _googleSignIn.signIn().then((value) {
      user = value;
      initData();
    }).catchError((error) {
      print("!!!!!!!!!!!!แตก $error");
    });
  }

  Future<void> doLoginSilent() async {
    await _googleSignIn.signInSilently().then((value) {
      user = value;
      initData();
    }).catchError((error) {
      print("!!!!!!!!!!!!แตก $error");
    });
  }

  Future<void> doLogout() async {
    await _googleSignIn.signOut().then((value) {
      user = null;
      _data = [];
      notifyListeners();
    }).catchError((error) {
      print("!!!!!!!!!!!!แตก $error");
    });
  }

  Future<void> initData() async {
    name = user!.displayName;
    CollectionReference userData =
        FirebaseFirestore.instance.collection(user!.email);

    final authedClient = GoogleAuthClient(await user!.authHeaders);

    final calendarAPI = calendar.CalendarApi(authedClient);
    final events = await calendarAPI.events.list('primary');
    for (final e in events.items!) {
      print(">>>>${e.summary}");
      //? check if event is in database
      DocumentSnapshot doc = await userData.doc(e.id).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
        _data.add(Activities(
            exp: data['exp'],
            location: UserLocation(
                name: data['locationName'],
                longtiude: data['longitude'],
                latitude: data['latitude']),
            attendStatus: AttendStatus.values[data['attendStatus']],
            calendarEvent: e));
      } else {
        //? if not add to database
        var dateTime = e.start!.dateTime ?? e.start!.date;
        var thatActivity = Activities(
            exp: 43 + Random().nextInt(3),
            location: UserLocation(name: "0", longtiude: 0, latitude: 0),
            attendStatus: AttendStatus.notyet,
            calendarEvent: e);
        if (dateTime!.isBefore(DateTime.now())) {
          thatActivity.attendStatus = AttendStatus.unknown;
          thatActivity.exp = 0;
        }
        _data.add(thatActivity);
        userData.doc(e.id).set(thatActivity.toJson());
      }
    }
    notifyListeners();
  }
}

class Activities {
  int exp;
  UserLocation location;
  AttendStatus attendStatus;
  calendar.Event calendarEvent;

  Activities(
      {required this.exp,
      required this.location,
      required this.attendStatus,
      required this.calendarEvent});

  String getName() {
    return calendarEvent.summary!;
  }

  DateTime getEventTime() {
    return calendarEvent.start!.dateTime!;
  }

  Map<String, dynamic> toJson() {
    return {
      'calendarId': calendarEvent.id,
      'exp': exp,
      'locationName': location.name,
      'longtiude': location.longtiude,
      'latitude': location.latitude,
      'attendStatus': attendStatus.index,
    };
  }
}

class UserLocation {
  String name;
  double longtiude;
  double latitude;
  //UserLocation(this.locationID, this.name, this.longtiude, this.latitude);
  UserLocation(
      {required this.name, required this.longtiude, required this.latitude});
}

//? from https://betterprogramming.pub/the-minimum-guide-for-using-google-drive-api-with-flutter-9207e4cb05ba
class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;

  final http.Client _client = new http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
