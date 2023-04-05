import 'package:flutter/material.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/just_account_manager.dart';
import 'package:provider/provider.dart';

import 'package:ai_tor_tell_you_an_appointment/data/data.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () {
                User provide = Provider.of<User>(context, listen: false);
                provide.doLogin();
              },
              child: const Text('SIGN IN'),
            ),
            ElevatedButton(
              onPressed: () {
                User provide = Provider.of<User>(context, listen: false);
                var data = provide.getActivities();
                print(">>>>>>>$data");
                print(">>>>>>>${data[13].calendarEvent.summary}");
              },
              child: const Text('GET'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
