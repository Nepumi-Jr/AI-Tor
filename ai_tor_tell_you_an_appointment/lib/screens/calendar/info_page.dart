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
              color: Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.white,
              child: Column(
                  children: [
                    const SizedBox(height: 20),
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
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(onPressed: () {
                          Navigator.of(context).pop();

                        },
                        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.primary)))
              ],
            )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary)),
                IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary))
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
            ListTile(leading: Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.primary,), title: Text('$startDate \nเวลา $startTime - \n$endDate \nเวลา $endTime', style: const TextStyle(fontSize: 16),)),
            ListTile(leading: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary), title: Text('$timeNoti นาทีก่อนกิจกรรม', style: const TextStyle(fontSize: 16)),),
            ListTile(leading: Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary), title: Text(place, style: const TextStyle(fontSize: 16))),
            ListTile(leading: Icon(Icons.list, color: Theme.of(context).colorScheme.primary), title: Text(description, style: const TextStyle(fontSize: 16))),
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