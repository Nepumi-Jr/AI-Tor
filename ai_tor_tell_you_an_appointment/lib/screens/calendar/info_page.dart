import 'package:flutter/material.dart';
import 'calendar_page.dart';

class InfoPage extends StatefulWidget {
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _icon(),
                    const Title(titleText: 'ประชุมงาน'),
                    const ListViews(startDate: '11/03/2566',
                      startTime: '03:02',
                      endDate: '12/03/2566',
                      endTime: '03.02',
                      timeNoti: '30',
                      place: 'EN040101',
                      description: 'อัพเดตความคืบหน้าโปรเจ็ค',),
                  ])
          )
      ),
    );
  }

  Widget _icon() {
    return Row(
      children: [
        Expanded(
            child: Container(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CalendarPage()));},
                    icon: const Icon(Icons.close, color: Colors.black,)))),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                IconButton(onPressed: null, icon: Icon(Icons.edit, color: Colors.black)),
                IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: Colors.black))
              ]))],
    );
  }
}


class ListViews extends StatelessWidget {
  final String startDate, endDate, startTime, endTime, timeNoti, place, description;
  const ListViews({Key? key, required this.startDate, required this.endDate, required this.startTime, required this.endTime, required this.timeNoti, required this.place, required this.description}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 40),
      child: Column(
          children: [
            ListTile(leading: const Icon(Icons.arrow_right, color: Colors.black), title: Text('$startDate \nเวลา $startTime - \n$endDate \nเวลา $endTime', style: const TextStyle(fontSize: 16),)),
            ListTile(leading: const Icon(Icons.notifications, color: Colors.black,), title: Text('$timeNoti นาทีก่อนกิจกรรม', style: const TextStyle(fontSize: 16)),),
            ListTile(leading: const Icon(Icons.location_on, color: Colors.black), title: Text(place, style: const TextStyle(fontSize: 16))),
            ListTile(leading: const Icon(Icons.list, color: Colors.black), title: Text(description, style: const TextStyle(fontSize: 16))),
          ]));
  }
}

class Title extends StatelessWidget {
  final String titleText;
  const Title({Key? key, required this.titleText}): super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.only(top: 20, left: 40),
      child: Text(titleText,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36
          )),
    );
  }
}