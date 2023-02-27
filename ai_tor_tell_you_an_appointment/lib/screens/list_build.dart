import 'package:flutter/material.dart';
import 'card.dart';
import 'data.dart';

class ListCreate extends StatefulWidget {
  final CardData cardData;
  const ListCreate({Key? key, required this.cardData}): super(key: key);

  @override
  ListCreateState createState() => ListCreateState();
}

class ListCreateState extends State<ListCreate> {
  late final int listLength = widget.cardData.dateData.length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listLength > 10? 10 : listLength,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: ListCard(
                date: widget.cardData.dateData[index],
                activity: widget.cardData.activityData[index],
                time: widget.cardData.timeData[index],
                place: widget.cardData.placeData[index]),);
      },
    );
  }
}