import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LogInPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child : Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('images/logo.png', height: 280, width: 280,),
                const SizedBox(height: 100),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: Image.asset(
                            'images/icon.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(height: 40,),
                        const Text('Sign-in with Google', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                        const SizedBox(width: 15,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
      );
  }
}
