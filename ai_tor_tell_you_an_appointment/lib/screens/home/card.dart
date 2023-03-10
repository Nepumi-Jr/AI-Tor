import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String date, activity, place, time;
  const ListCard({Key? key, required this.date, required this.activity, required this.time, required this.place}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 500,
      height: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date,
                  style: _textStyle()),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Container(
                      child: Column(
                        children: [
                          Text("กิจกรรม:",
                              style: _textStyle()),
                          Text(activity,
                              style: _textStyle())
                        ],
                      ),
                    ),),
                    Expanded(child: Container(
                      child: Column(
                        children: [
                          Text("สถานที่:",
                              style: _textStyle()),
                          Text(place,
                              style: _textStyle())
                        ],
                      ),
                    )),
                    Expanded(child: Container(
                      child: Column(
                        children: [
                          Text("เวลา:",
                              style: _textStyle()),
                          Text(time,
                              style: _textStyle())
                        ]
                      )
                    ))
                  ]
                )
              )
            ]
          )
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        fontWeight: FontWeight.w500,
    );
  }
}