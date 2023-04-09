import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

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
  bool isLoadingData = false;
  List<Activities> _data = [];
  User() {
    if (Platform.isIOS) {
      _googleSignIn = GoogleSignIn(
        clientId: '980513016939-of3n4bvg8k9b47cq51gk1vuogfqkuroo',
        scopes: _scope,
      );
    }
  }

  List<Activities> getActivities() {
    return _data;
  }

  List<Activities> getActivitiesAtDay(DateTime dateTime) {
    List<Activities> result = [];
    var ddata = getActivities();
    for (final e in ddata) {
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
    var ddata = getActivities();
    for (final e in ddata) {
      if (e.attendStatus == AttendStatus.attend) sum += e.exp;
    }
    return sum;
  }

  int? getExpAtDay(DateTime dateTime) {
    var dData = getActivitiesAtDay(dateTime);
    if (dData.isEmpty) return null;
    int sum = 0;
    for (final e in dData) {
      if (e.attendStatus == AttendStatus.attend) sum += e.exp;
    }
    return sum;
  }

  int? getPercentRate() {
    if (_data.isEmpty) return null;
    int allEvent = 0;
    int attendEvent = 0;
    var ddata = getActivities();
    for (final e in ddata) {
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

  List<Activities> getIncompleteActivities() {
    //? or incoming
    List<Activities> result = [];
    var ddata = getActivities();
    for (final e in ddata) {
      if (e.attendStatus == AttendStatus.notyet) {
        result.add(e);
      }
    }

    //? sort by time
    result.sort((a, b) => a.getEventTime().compareTo(b.getEventTime()));

    return result;
  }

  Future<void> dataGetsUpdate() async {
    notifyListeners();
  }

  Activities getActivitiesById(String id) {
    return _data.firstWhere((element) => element.calendarEvent.id == id);
  }

  Future<void> addActivities(String title, DateTime dateStart, DateTime dateEnd,
      String description, String location) async {
    //? add to Google calendar first
    final authedClient = GoogleAuthClient(await user!.authHeaders);
    final calendarAPI = calendar.CalendarApi(authedClient);
    //? add new event to calendar
    final newEvent = calendar.Event();
    newEvent.summary = title;
    newEvent.description = description;
    newEvent.start =
        EventDateTime(dateTime: dateStart, timeZone: 'Asia/Bangkok');
    newEvent.end = EventDateTime(dateTime: dateEnd, timeZone: 'Asia/Bangkok');

    print(">>>>>>>>>>>>>$dateStart to $dateEnd");

    newEvent.location = location;

    //? push to google calendar
    final event = await calendarAPI.events.insert(newEvent, 'primary');

    //? add to local data
    var newActivity = Activities(
        attendStatus: AttendStatus.notyet,
        calendarEvent: event,
        exp: 43 + Random().nextInt(3),
        location: UserLocation(name: location, latitude: 0, longtiude: 0));
    _data.add(newActivity);

    CollectionReference userData =
        FirebaseFirestore.instance.collection(user!.email);
    DocumentSnapshot doc = await userData.doc(event.id).get();
    userData.doc(event.id).set(newActivity.toJson());
    dataGetsUpdate();
  }

  Future<void> editActivities(String id, String title, DateTime dateStart,
      DateTime dateEnd, String description, String location) async {
    //? add to Google calendar first
    final authedClient = GoogleAuthClient(await user!.authHeaders);
    final calendarAPI = calendar.CalendarApi(authedClient);
    //? add new event to calendar
    final newEvent = calendar.Event();
    newEvent.summary = title;
    newEvent.description = description;
    newEvent.start =
        EventDateTime(dateTime: dateStart, timeZone: 'Asia/Bangkok');
    newEvent.end = EventDateTime(dateTime: dateEnd, timeZone: 'Asia/Bangkok');
    newEvent.id = id;

    newEvent.location = location;

    //? push to google calendar
    final event = await calendarAPI.events.patch(newEvent, 'primary', id);

    //? add to local data
    var newActivity = Activities(
        attendStatus: AttendStatus.notyet,
        calendarEvent: event,
        exp: 43 + Random().nextInt(3),
        location: UserLocation(name: location, latitude: 0, longtiude: 0));
    _data.remove(getActivitiesById(id));
    _data.add(newActivity);

    CollectionReference userData =
        FirebaseFirestore.instance.collection(user!.email);
    DocumentSnapshot doc = await userData.doc(event.id).get();
    userData.doc(event.id).set(newActivity.toJson());
    dataGetsUpdate();
  }

  void removeActivities(String id) {
    _data.remove(id);
    //TODO : add to database
    //TODO : add to Google calendar
    dataGetsUpdate();
  }

  Future<void> doLogin() async {
    await _googleSignIn.signIn().then((value) {
      user = value;
      if (user != null) initData();
    }).catchError((error) {
      print("!!!!!!!!!!!!แตก $error");
    });
  }

  Future<void> doLoginSilent() async {
    await _googleSignIn.signInSilently().then((value) {
      user = value;
      if (user != null) initData();
    });
  }

  Future<void> doLogout() async {
    await _googleSignIn.signOut().then((value) {
      user = null;
      _data = [];
    });
  }

  Future<void> initData() async {
    isLoadingData = true;
    name = user!.displayName;
    CollectionReference userData =
        FirebaseFirestore.instance.collection(user!.email);

    final authedClient = GoogleAuthClient(await user!.authHeaders);

    final calendarAPI = calendar.CalendarApi(authedClient);
    //? get all calendarID list
    final calendarList = (await calendarAPI.calendarList.list()).items!;

    //? get list of doc id
    List<String> querySnapshot =
        (await userData.get()).docs.toList().map((e) => e.id).toList();
    Set<String> querySnapshotSet = {};
    for (final e in querySnapshot) {
      querySnapshotSet.add(e);
    }

    for (final calendarList in calendarList) {
      print(">>>>>>>GET ${calendarList}");
      print(">>>>>>>GET ${calendarList.id}");
      print(">>>>>>>GET ${calendarList.kind}");
      print(">>>>>>>GET ${calendarList.accessRole}");

      if (calendarList.accessRole != "owner" &&
          calendarList.accessRole != "writer") continue;

      final events =
          await calendarAPI.events.list(calendarList.id!, maxResults: 2000);
      for (final e in events.items!) {
        print(
            ">>>>>>>GET ${e.creator?.displayName} -> ${e.summary} -> ${e.start}");
        //? check if event is in database
        DocumentSnapshot doc = await userData.doc(e.id).get();

        if (querySnapshotSet.contains(e.id)) {
          Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
          _data.add(Activities(
              exp: data['exp'],
              location: UserLocation(
                  name: data['locationName'],
                  longtiude: data['longtiude'],
                  latitude: data['latitude']),
              attendStatus: AttendStatus.values[data['attendStatus']],
              calendarEvent: e));
        } else {
          //? if not add to database
          if (e.start == null) continue;
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
    }
    dataGetsUpdate();
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>DONE");
    isLoadingData = false;
  }

  Future<void> reloadData() async {
    _data = [];
    initData();
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
    var dateTimeData =
        calendarEvent.start!.dateTime ?? calendarEvent.start!.date;
    //? offset with device timezone
    DateTime timeNow = DateTime.now();
    dateTimeData = (dateTimeData ?? timeNow)
        .add(Duration(hours: timeNow.timeZoneOffset.inHours));
    return dateTimeData;
  }

  DateTime getEndEventTime() {
    var dateTimeData = calendarEvent.end!.dateTime ?? calendarEvent.end!.date;
    //? offset with device timezone
    DateTime timeNow = DateTime.now();
    dateTimeData = (dateTimeData ?? timeNow)
        .add(Duration(hours: timeNow.timeZoneOffset.inHours));
    return dateTimeData;
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
