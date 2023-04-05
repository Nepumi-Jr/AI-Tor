import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';

class ListCard extends StatelessWidget {
  final String date, activity, place, time;
  ListCard(
      {Key? key,
      required this.date,
      required this.activity,
      required this.time,
      required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 500,
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(date,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary)),
                    // const Text("เวลา:",
                    //     style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                    Text(time,
                        style: TextStyle(
                            fontSize: 19.2,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary))
                  ])),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Text("${LangMan.get().home.tilesActivity}:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary)),
                      Text(
                        activity,
                        style: _textStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("${LangMan.get().home.tilesLocation}:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary)),
                    Text(place, style: _textStyle())
                  ],
                ),
              ),
            ],
          )
        ]));
  }

  TextStyle _textStyle() {
    return const TextStyle(
      decoration: TextDecoration.none,
      //fontSize: 14
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
}
