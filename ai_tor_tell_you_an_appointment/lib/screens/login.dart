import 'package:flutter/material.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/just_account_manager.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/just_fire_store.dart';
import 'package:http/http.dart' as http;

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
                //TODO : Login
                doLogin();
              },
              child: const Text('SIGN IN'),
            ),
            ElevatedButton(
              onPressed: () {
                get_dddata().then((value) {
                  print(value.data());
                });

                //Navigator.pushNamed(context, '/calendar');
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
