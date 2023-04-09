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
      appBar: AppBar(
        title: Text("About App",
            style: TextStyle(color: Theme.of(context).brightness != Brightness.dark ? Colors.black : Colors.white)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
        foregroundColor: Theme.of(context).colorScheme.primary
        ),
      body: Column(
        children: <Widget>[
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: 400,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Material(
            color: Theme.of(context).colorScheme.primary,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(24.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    child: _text(text: "AI Tor", fontSize: 40.0, fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white)
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: _text(text: "version alpha 0.0.1",
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white)
                  )
                ],
              ),
            )
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 400,
          width: 400,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Material(
            color: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(24.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _text(text: "Member", fontSize: 40.0, fontWeight: FontWeight.bold),
                  _text(text: "Peeraphol  Sudputong"),
                  _text(text: '633040167-9'),
                  _text(text: 'Metawin    Sumethiwit'),
                  _text(text: '633040173-4'),
                  _text(text: 'Aphichit  Anthapanya'),
                  _text(text: '633040183-1'),
                  SizedBox(height: 15),
                  _text(text: "Present",fontSize: 40.0, fontWeight: FontWeight.bold),
                  _text(text: "Kanda Saikaew")
                ],
              ),
            )
          )
        )
      ]
      )
    );
  }

  Widget _text({required String text, double? fontSize = 16, FontWeight? fontWeight = FontWeight.w400, Color? color}) {
    return Text(text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),);
  }
}

