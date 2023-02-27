import 'package:flutter/material.dart';

class infoCard extends StatelessWidget {
  final String name, lv, img, progress, motivateText;
  const infoCard({Key? key, required this.name, required this.lv, required this.img, required this.progress, required this.motivateText,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(name,
                style: _textStyle(),)),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(lv,
                  style: _textStyle())),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(img),
                  radius: 100,
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(progress,
                  style: _textStyle())),
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(motivateText,
                  style: _textStyle()))
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 25);
  }
}