import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class infoCard extends StatelessWidget {
  final String name, lv, img, progress, motivateText;
  const infoCard({Key? key, required this.name, required this.lv, required this.img, required this.progress, required this.motivateText,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
      width: screenW,
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
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 5.0,
                percent: 0.1,
                reverse: true,
                backgroundColor: Colors.white,
                progressColor: Theme.of(context).colorScheme.primary,
                center: const CircleAvatar(
                    backgroundImage: AssetImage('images/test.jpg'),
                    radius: 90
                ),
              ),
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
                  style: _textStyle())),
          const SizedBox(height: 15)
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