import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/faceImage.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';

class UserInfoCard extends StatelessWidget {
  //? These data could be retrieve from internal backend data

  const UserInfoCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TODO: score calculation and retrieve info will run from here

    final screenW = MediaQuery.of(context).size.width;
    return Consumer<User>(
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromRGBO(66, 66, 66, 1)
          : Colors.white,
      width: screenW,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                name,
                style: _textStyle(),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                  LangMan.interpolate(
                      LangMan.get().home.levelFormat, [level, exp, maxExp]),
                  style: _textStyle())),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 5.0,
                percent: 0.1,
                reverse: true,
                backgroundColor: Colors.white,
                progressColor: Theme.of(context).colorScheme.primary,
                center: 
                CircleAvatar(
                  backgroundImage: img,
                  radius: 100,
                ),
              ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                  LangMan.interpolate(
                      LangMan.get().home.percentFormat, [accuracy]),
                  style: _textStyle())),
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(motivateText,
                  style: _textStyle())),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(decoration: TextDecoration.none, fontSize: 25);
  }
}
