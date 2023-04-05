import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

import 'package:http/http.dart' as http;

late GoogleSignInAccount? user;

Future<void> doLogin() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/calendar'
    ],
  );

  if (Platform.isIOS) {
    print(">>> YOU ARE IOS");
    _googleSignIn = GoogleSignIn(
      clientId: '980513016939-of3n4bvg8k9b47cq51gk1vuogfqkuroo',
      scopes: <String>[calendar.CalendarApi.calendarScope],
    );
  }
  print(">>> Try to sign in");
  await _googleSignIn.signIn().then((value) {
    user = value;
    print(">>>>>>>>>>>>>>>>AFTER LOGIN");
    print(user!.email);
  }).catchError((error) {
    print("!!!!!!!!!!!!แตก $error");
  });
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

//? (just) get calendar data
Future<List<calendar.Event>?> getCalendarData() async {
  final authedClient = GoogleAuthClient(await user!.authHeaders);
  //final HttpClient httpClient = HttpClient(await user!.authHeaders);

  final calendarAPI = calendar.CalendarApi(authedClient);
  final events = await calendarAPI.events.list('primary');
  return events.items;
}
