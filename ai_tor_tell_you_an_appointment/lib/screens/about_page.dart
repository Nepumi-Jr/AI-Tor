import 'package:flutter/material.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/faceImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About App")),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 400,
            margin: const EdgeInsets.only(left: 10, right: 10),
                  // padding: const EdgeInsets.only(bottom: 100),
            child: Material(
              color: Colors.blue,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Padding(
                padding: EdgeInsets.all(8.0),              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    Text(
                      "AI Tor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "version alpha 0.0.1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 400,
            width: 400,
            margin: const EdgeInsets.only(left: 10, right: 10),
                  // padding: const EdgeInsets.only(bottom: 100),
            child: Material(
              color: Colors.white70,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Padding(
                padding: EdgeInsets.all(8.0),              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    Text(
                      "Member",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Peeraphol  Sudputong",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Metawin    Sumethiwit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Aphichit     Anthapanya",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Present",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kanda Saikaew",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            )
          )
        ]
      )
      )
    );
  }
}

