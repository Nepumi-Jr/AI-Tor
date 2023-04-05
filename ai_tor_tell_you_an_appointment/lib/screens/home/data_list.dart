import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import 'data.dart';
import 'list_build.dart';
import 'package:intl/intl.dart';

class DataList extends StatefulWidget {
  @override
  DataListState createState() => DataListState();
}

class DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, uData, child) {
        List<String> date_data = [];
        List<String> activity_data = [];
        List<String> time_data = [];
        List<String> place_data = [];

        for (var aData in uData.getIncompleteActivities()) {
          var timeEvent = aData.getEventTime();

          date_data.add(DateFormat('dd/MM/yyyy').format(timeEvent));
          time_data.add(DateFormat('HH:mm').format(timeEvent) +
              ' - ' +
              DateFormat('HH:mm').format(aData.getEndEventTime()));
          activity_data.add(aData.calendarEvent.summary.toString());
          place_data.add(aData.location.name);
        }

        return Container(
          child: ListCreate(
            cardData: CardData(date_data, activity_data, time_data, place_data),
          ),
        );
      },
    );
  }
}
