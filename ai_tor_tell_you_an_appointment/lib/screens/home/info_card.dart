import 'package:flutter/material.dart';
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
      builder: (context, uData, child) {
        final String name = uData.name ?? "No Name";
        const int level = 1;
        final int? exp = uData.getExp();
        const int maxExp = 100;
        final int? accuracy = uData.getPercentRate(); //? range from 1 to 100

        late final ImageProvider img;
        late final String motivateText;

        if (accuracy == null) {
          img = FaceImage.getImageIndex(0);
          motivateText = LangMan.get().home.commentHappy;
        } else if (accuracy > 95) {
          img = FaceImage.getImageIndex(0);
          motivateText = LangMan.get().home.commentHappy;
        } else if (accuracy > 60) {
          img = FaceImage.getImageIndex(1);
          motivateText = LangMan.get().home.commentNormal;
        } else if (accuracy > 45) {
          img = FaceImage.getImageIndex(2);
          motivateText = LangMan.get().home.commentSad;
        } else if (accuracy > 30) {
          img = FaceImage.getImageIndex(3);
          motivateText = LangMan.get().home.commentAngry;
        } else {
          img = FaceImage.getImageIndex(4);
          motivateText = LangMan.get().home.commentDead;
        }

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
                      (exp == null)
                          ? LangMan.get().home.unknownLevel
                          : LangMan.interpolate(LangMan.get().home.levelFormat,
                              [level, exp, maxExp]),
                      style: _textStyle())),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: img,
                      radius: 100,
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                      (accuracy == null)
                          ? LangMan.get().home.unknownPercent
                          : LangMan.interpolate(
                              LangMan.get().home.percentFormat, [accuracy]),
                      style: _textStyle())),
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(motivateText, style: _textStyle()))
            ],
          ),
        );
      },
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(decoration: TextDecoration.none, fontSize: 25);
  }
}
