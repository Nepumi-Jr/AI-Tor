import 'package:flutter/material.dart';

import 'data.dart';
import 'list_build.dart';

class DataList extends StatefulWidget {

  @override
  DataListState createState() => DataListState();
}

class DataListState extends State<DataList> {
  static List<String> date_data = ['27/02/2566', '28/02/2566', '01/03/2566', '02/03/2566', '02/03/2566', '02/03/2566', '02/03/2566', '02/03/2566', '02/03/2566', '02/03/2566', '02/03/2566'];
  static List<String> activity_data = ['สอบ', 'เรียน', 'บลาๆๆ', 'bruh', 'bruh', 'bruh', 'bruh', 'bruh', 'bruh', 'bruh', 'bruh'];
  static List<String> time_data = ['10.30 - 12.00', '13.30 - 14.00', '12.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00', '11.30 - 15.00'];
  static List<String> place_data = ['EN040201', 'EN040101', 'EN040301', 'EN040501', 'EN040501', 'EN040501', 'EN040501', 'EN040501', 'EN040501', 'EN040501', 'EN040501'];
  final List<CardData> listData = List.generate(date_data.length,
          (index) => CardData(date_data, activity_data, time_data, place_data));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListCreate(cardData: CardData(date_data, activity_data, time_data, place_data))
    );
  }
}


